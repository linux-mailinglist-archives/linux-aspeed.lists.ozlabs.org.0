Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BD288C61D
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Mar 2024 16:01:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Os6lz8rX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3tKQ6HrCz3vct
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 02:00:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Os6lz8rX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3tK9690gz3vYt
	for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 02:00:45 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6e4e51b0bfcso2680891a34.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Mar 2024 08:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711465242; x=1712070042; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNSpu6YM8BptgR2qjrv8QihJHcI+7VsMuE3/EFlGmdw=;
        b=Os6lz8rXLt7WiNvvyj5eKgHwieabb8vG4QS5YOrBVNzUTeBM76PDkraZe69S8Wj6Ph
         69JEfS6IZWGvkwCN1YL5zunkMBrTkMfBMRzX3dJ4cVLrmVFIvwG9x4uueZMZEVsmrywK
         ter5Vidslg+pBd/D5kiiFjyz78Bqq8ol1NVeYILzuNughITfvNgDbrhAxg+HYLS0vxxy
         ZKuwsrPD7UXxpjHdf3vUJSW0FZOu0M/1F4NGcCEfG4KGbu2s0HZcNZQhoP9dpONoVTC+
         B+am2jM7LR0F7GnBoIjj+VQQBwlbRlCJWIPeVwkMcvaXJ4pEWvXMhblxvj+7ali+wZyu
         2UAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711465242; x=1712070042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNSpu6YM8BptgR2qjrv8QihJHcI+7VsMuE3/EFlGmdw=;
        b=Vz52dKO+rB/Bds3vlYJzFZPlSYAz91PSIkKIX9os9PF2kdYDASLt2Lo02iA2EtPnWe
         Nvz7aUpZsr4n8pr9XOXqHEZnMi9PVugR8qBpAb/9Qr2ONzlLdayHx3MJ0mSSK7RZhY/g
         f8NZoVU8Pywtop2QnLWBXzMZPwb/dS3Rj3au/c6W2aNY9NAjacez8zQhPJlRMTQXw0dZ
         ouuMk0OLu4Xo1sYvmu6kpTeZeJ2vOBarADzi5mqV/qRofNbT9OAS6PrwwcWHDiLHgsYp
         tvrNH3GF7AR25NrHYisE8IJD6k8bvyj7xi8XQB8IvG462eeYd7rOyX/9CRoLQjNHKqw9
         gjgg==
X-Forwarded-Encrypted: i=1; AJvYcCWdP4ul79eKsbmELP4zhv0BmtZnmM1Gv9SYh5A/i+ODDOxh0qvXzQhbYURbRYXRjrSxkZKtSBYMPiDasYUSa8rArzywNd3Wjvi43DLplQ==
X-Gm-Message-State: AOJu0YyGPPBNuQX1wgUkiyOMAm1+uU57MtXqwnfUA+ys/PXT16hmiHrv
	a5PmGKvoHFkDZcH9xjcmXfaExMxiSkeAVlreSxFFEXhp4+5d69Rq
X-Google-Smtp-Source: AGHT+IG+eQB9Du+89O9YPqZUBHKoPkGBuBszCclR0pKdvZy2gkL+dMe3RVVwPqyf1FUChuKP+urjPg==
X-Received: by 2002:a05:6870:5693:b0:222:12dc:8af7 with SMTP id p19-20020a056870569300b0022212dc8af7mr11124988oao.59.1711465242163;
        Tue, 26 Mar 2024 08:00:42 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id l27-20020a635b5b000000b005dcbb855530sm7658404pgm.76.2024.03.26.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:00:41 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] ARM: dts: aspeed: Add the AST2600 WDT with SCU register
Date: Tue, 26 Mar 2024 23:00:25 +0800
Message-Id: <20240326150027.3015958-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240326150027.3015958-1-peteryin.openbmc@gmail.com>
References: <20240326150027.3015958-1-peteryin.openbmc@gmail.com>
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

The AST2600 Watchdog Timer (WDT) references
the System Control Unit (SCU) register for its operation.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 5f640b7d6b6d..2f7788f2f153 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -558,23 +558,27 @@ uart5: serial@1e784000 {
 			wdt1: watchdog@1e785000 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785000 0x40>;
+				aspeed,scu = <&syscon>;
 			};
 
 			wdt2: watchdog@1e785040 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785040 0x40>;
+				aspeed,scu = <&syscon>;
 				status = "disabled";
 			};
 
 			wdt3: watchdog@1e785080 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e785080 0x40>;
+				aspeed,scu = <&syscon>;
 				status = "disabled";
 			};
 
 			wdt4: watchdog@1e7850c0 {
 				compatible = "aspeed,ast2600-wdt";
 				reg = <0x1e7850C0 0x40>;
+				aspeed,scu = <&syscon>;
 				status = "disabled";
 			};
 
-- 
2.25.1

