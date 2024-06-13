Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBAE907691
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Jun 2024 17:26:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F3EphBU1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0R8r2XQHz3cXV
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jun 2024 01:26:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F3EphBU1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0R8b5gK3z3cVl
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jun 2024 01:26:38 +1000 (AEST)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5b96a78639aso480763eaf.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jun 2024 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718292395; x=1718897195; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Fc9TZXsE236e5GqF1+goY1wiMOdU1srHkjJ5LtjJyI=;
        b=F3EphBU1tNsmpI4otK30Dbr0y0PkijPAsLsyi6DTPhPDHdGLWyOr7TDoo+5BShkAqC
         7LLPGDZmAnIApp2a0HYFcvj3b9uPjYh5wW7UHK7wlf1414KCQ/MjcX4EkvPo6yUVOYa6
         hVyVjBciPA3x7KDMz9W/guwoJW7vNBO0bh3q0ib9QDVsU6tcMsf6JXhzzAG6MOINkReP
         jN/qmNkB21bXf39iy0LdWMadC7roUoyRkkDZRCrDpzJ93ExtbLMhwTY+svTUL1GXXlUP
         RV43ClVUvMobi3npAJAkgn0m6td+VVAFMdAtk+b6EMmx2VSotBi5o54gN6qPkZRV/XHM
         RCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718292395; x=1718897195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Fc9TZXsE236e5GqF1+goY1wiMOdU1srHkjJ5LtjJyI=;
        b=j/KfVfk7wAkDNOtTo/Lhojv8een1fxMXfi5vUxCPL3VWxOOQ2CqcTZUBfbdaS1owpt
         K/UkqMH1cihQ7nCXOJdPYYthZhAGBh07nmGel5CMCCdKPRb04yvdWdH9PN269a1fVSYe
         AJBmzuevyQWCrW1ZfG0N50apBQ4mBGAGz0zz5qKuhEZJZURwef3RcbVsuvoWhWli30A9
         B02hDGZFfdJjI1tiOqH6CvoGV42+Ig8Cfit5eRkZ52AY2FcRR+D0FC9DSyVb8ipW21ZW
         N+0ylz5QsTHkJemYWT3aYAbyViCJCpZXaI5YH03hnSCJTs2kOz2uVkPukE9MemshvIo5
         cyng==
X-Forwarded-Encrypted: i=1; AJvYcCX6Y4/M4SrApDgbcQEgQ3DF06exZEOBVTPsGr1THEdWOIEUquzx8TrWebvnx6KOlVbMYwR+5hUpJlYxtSV+2xp0oPSibc2lMT4xY2Wwbw==
X-Gm-Message-State: AOJu0YzeOcLAZrTqvHmrFLIStz0KWTMvRNGUn+bDAn+vOH31DYSzB045
	oDqfkXTkHCFvRSz2nHxuFMeOuxSjPxSjEYrscxRwhMq6ntgizbrJaL4bdg==
X-Google-Smtp-Source: AGHT+IHXk6+NGB+wlv3K2wgPenwKml/Ptt86KSEMMpXMNRhhb/1ZjPkonhAwss/lf2RD9vI4xmBw9Q==
X-Received: by 2002:a05:6358:e4aa:b0:19f:4be7:435a with SMTP id e5c5f4694b2df-19fb500d5d1mr8865055d.25.1718292395197;
        Thu, 13 Jun 2024 08:26:35 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee41663d2sm1198183a12.92.2024.06.13.08.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:26:34 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/7] ARM: dts: aspeed: Harma: add VR device
Date: Thu, 13 Jun 2024 23:24:20 +0800
Message-Id: <20240613152425.1582059-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
References: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
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

Add isl69260, xdpe152c4 device

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 0d349ce1f3e6..ef5ffe190445 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -398,6 +398,30 @@ imux28: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			power-monitor@61 {
+				compatible = "isil,isl69260";
+				reg = <0x61>;
+			};
+			power-monitor@62 {
+				compatible = "isil,isl69260";
+				reg = <0x62>;
+			};
+			power-monitor@63 {
+				compatible = "isil,isl69260";
+				reg = <0x61>;
+			};
+			power-monitor@64 {
+				compatible = "infineon,xdpe152c4";
+				reg = <0x64>;
+			};
+			power-monitor@66 {
+				compatible = "infineon,xdpe152c4";
+				reg = <0x66>;
+			};
+			power-monitor@68 {
+				compatible = "infineon,xdpe152c4";
+				reg = <0x68>;
+			};
 		};
 		imux29: i2c@1 {
 			#address-cells = <1>;
-- 
2.25.1

