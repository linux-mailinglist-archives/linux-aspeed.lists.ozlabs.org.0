Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF46285D3E2
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 10:41:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=elBVYDLV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfrrq3fK2z3cbl
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 20:41:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=elBVYDLV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfrrc44lnz2yhZ
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 20:41:36 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3bb9d54575cso253558b6e.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 01:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708508493; x=1709113293; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pegTGAgIl7701EaFNdsQSg89lpjeCGj36MeNrr3t5wk=;
        b=elBVYDLVH83ZvVXyrarBGqo9AKcxGziYemPyDpwfWPgn+9J+B8uG+tNyqs0MDVMmW3
         FoqcWdGviiJrPMQwgfhQefywztxtrLnfqIMSf/xtOA34OEO2WdsOu4Uy4f+ZYrO5hfru
         pKm5MrpeFgICuOCMs9Ek7ld+hxtxMJzPD51XgKn+s4yY0XSVuAfVBMBsv81ET/H7pngY
         4h4Z8HH+CV1au3MyKG7hk3qA+s1LxdYSy46Uonofxcb8YjLzLuw/qWCzFy3llho+BHqt
         LC1EeDBI28W7pT5vfYuaOYs2w5kA67WG3DIr+bm62pLJmMrMqhccENqUY4NfB15FFUXB
         4XUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508493; x=1709113293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pegTGAgIl7701EaFNdsQSg89lpjeCGj36MeNrr3t5wk=;
        b=rSE6t2FeEivPg//eF3erfFSd7a2TIC9+oe9tHjxYUDq0AwNg8VukZcRrnzw8G7Jsei
         vOqHiGD2MwV6Ws9Xv2xICO77KQkwJxLsq5lXhVdVaYSdQtOdORQW/VoafmL2OWdgebsb
         s1VU7h1Gfo0OruXD+kr8j6Tint8Vo5+7HkAWCiyhNEDmQt33szmdNodwRpCa4vqTm56B
         2pWI3jP+e7Q85Ke1/SacdaMf9KYMHQCEWSNOVTJaW+chbe7Mxpr0+1lpODpWqVVi0lJ/
         zp2Xh0vnMAwyb4KcEgGx2tt44Y5phajoEIqteG5FwHT/UXS9DeLgjcCuvQ07VgQe7gNQ
         XoCg==
X-Forwarded-Encrypted: i=1; AJvYcCUhDC3Ns1eLy07R0zOK0entAz6j78tlJFnnmrYqkfR0eYPYg8wFTv6HCGeHocYaKMUtmI/DlkEPkfPkZKPcwKfmJ5QRI+wz/0jDCQrL/w==
X-Gm-Message-State: AOJu0YzWSGcjSgKMVxphRhCZqWZsJc7dNPEQ2ctOzhX9M41vZWKDVaqV
	kwsfpSPAlNZSBNvOu4k2VhTgl7zEV9CxtaFLeVrYjOfC3C9XbwdN
X-Google-Smtp-Source: AGHT+IFC2zgBN0UcD8wSEP83Sn9N8sisyohWaovgJYqL2xWu2TfI7wbcUFKafbkvIvCX7DRAyIk9Lw==
X-Received: by 2002:a05:6808:1891:b0:3c1:3f1b:ffea with SMTP id bi17-20020a056808189100b003c13f1bffeamr18441893oib.47.1708508493376;
        Wed, 21 Feb 2024 01:41:33 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id lm4-20020a056a003c8400b006e488553f09sm1645026pfb.81.2024.02.21.01.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 01:41:33 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] ARM: dts: aspeed: Harma: mapping ttyS2 to UART4.
Date: Wed, 21 Feb 2024 17:39:17 +0800
Message-Id: <20240221093925.2393604-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
References: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Change routing to match SOL(Serial Over LAN) settings.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 8a173863ef24..a0056d633eb1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -12,8 +12,8 @@ / {
 
 	aliases {
 		serial0 = &uart1;
-		serial1 = &uart6;
-		serial2 = &uart2;
+		serial1 = &uart2;
+		serial2 = &uart4;
 		serial4 = &uart5;
 
 		i2c20 = &imux20;
-- 
2.25.1

