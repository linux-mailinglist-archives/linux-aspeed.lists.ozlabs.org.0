Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7718242F3
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Jan 2024 14:47:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y/JfmFOc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5SZz4yN2z3cYp
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Jan 2024 00:47:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y/JfmFOc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5SZm36Nkz30f8
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Jan 2024 00:47:44 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-28b6218d102so379733a91.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Jan 2024 05:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704376062; x=1704980862; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pegTGAgIl7701EaFNdsQSg89lpjeCGj36MeNrr3t5wk=;
        b=Y/JfmFOcJAvgeVViK6EJqsHgHj8aQaP8NXMaloFWc+R0Xmg9EWY7C6lB+VYgnL07tM
         /Xw9rmkdOFXv9NZXdBVjz90/foVX1XxLVcVApV7qq3QUkqbbn/WaAKWTM12n2laKaJFM
         ibCY9fqi9Myy+7I0LArYHXIaoHmB9nuAvrxUovFNXmaoM/UtTed0EWQV9a9+CBYPwoOo
         uWi6nahFca20IrIUZG9ET9Z+iipi/H0hUme4V4/DiDpEngHO4Z6SOMggGWgvN386l7+0
         LBE0KZSqZUTmIuiU/NyNMf9sKlmco5cWfhRNl/UyGHoSEKX0EPt0eC9LZ1yXsCVgf4lL
         6zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704376062; x=1704980862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pegTGAgIl7701EaFNdsQSg89lpjeCGj36MeNrr3t5wk=;
        b=AeshK20HI0ZSPCIbK3SrVBGI6TNqHAXHmWtFvp0luytHc9LSuc4JlOdge0UIZcZtwk
         nxg5Mc6BWW/XAALH/leWyxSjG/hkpUMd+2nKgoDcWJi4uaqvNUzgN2H/V14urgqRzMuW
         lD0Vtowt2geW45S93GFA1KpCLO6sMQ5A+XQF5iuSBjzwH98VdWVfM2dJf8uw5hW/Ve/M
         F/VVaQrKYaK+XhzssnqgXMa2ZPZtYgmti9Fv/Mo3QIeZefuff/ucRa5dh7l8KNyS/yjw
         7CdcB+jtot8UBTxUR6Uw+WOajQDd6oH2hQdRT68ppAEGsi27rBUI2k6+VU/LarDHvjZu
         KdFA==
X-Gm-Message-State: AOJu0Yy/VrPObXGsEvFrxl8Kd7Xq4YmhvJ7LU29Btg92YwBVVusZGTDi
	Oi/kva1FSZy/568VbGKyQgg=
X-Google-Smtp-Source: AGHT+IFCbGdnPEtxJYKYWC3wH6B6pOmF3J7YVEBHF0oMLhCvgGy2SmtHvjHpNVtfg0AjaZGf0RoPqg==
X-Received: by 2002:a17:90a:d149:b0:28c:2786:48be with SMTP id t9-20020a17090ad14900b0028c278648bemr535511pjw.49.1704376062106;
        Thu, 04 Jan 2024 05:47:42 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a22-20020a1709027d9600b001d425d495c9sm22990550plm.190.2024.01.04.05.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 05:47:41 -0800 (PST)
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
Subject: [PATCH v2 2/6] ARM: dts: aspeed: Harma: mapping ttyS2 to UART4.
Date: Thu,  4 Jan 2024 21:45:28 +0800
Message-Id: <20240104134532.536793-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240104134532.536793-1-peteryin.openbmc@gmail.com>
References: <20240104134532.536793-1-peteryin.openbmc@gmail.com>
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

