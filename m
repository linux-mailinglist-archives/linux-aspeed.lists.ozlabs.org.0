Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B06E2919FCE
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 09:01:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=boUGmnJp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8qGm10qbz3cQL
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 17:01:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=boUGmnJp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8qG80Mkgz3cX7
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 17:00:31 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-706524adf91so4665406b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 00:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719471631; x=1720076431; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gix3DBO+oHGmr+N4AH/BAu7/Kk6dQdl46Hkauc/qyS8=;
        b=boUGmnJpavOmpxWPJnJrJPtIGVjmi9AYfHncbNHkhU0v6br+3wPkqFDHRgWcsukqSh
         F7Fb2XNYEtRfjqmbZejj2yVcK6/DWWS3nUnepz0h66WVN3NQDahyvAGUG6K4ltXzU+Nr
         8/XFjaIdcl8O2cm25JY8VpGI27cqC5NQ7f5TVPqLf8+88DAX7hMhVTGLgisgw5n3sywS
         DkwjwzvCyujkBgGsw09aG5j4hDSc+UAmUU7vgXRPzBYcc3MOQmzU0BCxN8ecjJXoT27f
         LdJNLaGdQsUkV5WHM4dcid90ihosz3T8atOunAOF+tPzOghAxcIDtGQZQG2aPvNdPnix
         6ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471631; x=1720076431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gix3DBO+oHGmr+N4AH/BAu7/Kk6dQdl46Hkauc/qyS8=;
        b=PSHIFF7raBS8I2wJaCkcwejjHjLmIoVgywVKj50zniwvdSLgaYwZK7fEDtxvszqvwm
         fCc0cCvKvxvgMxFJx3tIFimrb+sSsRiPeWC51vi9m5EwwoUpLLAAnahm/CIFTrCXeLMg
         sPm+3NPgIgamZeIOSSLxRa8mUyz4GRPum1E5ecCXpreiPt4S+XsvAh9t1Tph+1fbzlE6
         WBibC308hIIFUDcuUzREokRh0hq0bOuyzmJZPKXCZnHUird5WCoxdCU5v2ccBl4A8jZI
         WbxaiyOkbjJVqoCWCKEXZ74TR5wCGWYz3x3K9AXgA9gSXLF7ScQORk7yRtJUPTvF7o85
         5qyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfnwwpKVVOBgdoAX6d/u1gdYhBFXUf15sGuaQIjnuphmCZR2Kc4IttT2fz29DnyqSUSTod+0yvyrAfNURkMzSJItlgN4V2pmA+gnD+og==
X-Gm-Message-State: AOJu0YzC7yqq3dFDx3Sby1LT/2uDgdFJIJyOimOkgX77pU7rtMzWcWPz
	9LI66/QpQLNPgoOha3voKEIQyFr7Sy78Nq0/R9g7yIJqdcdhp732
X-Google-Smtp-Source: AGHT+IH1VSEO3FBILEDGjF/Yh9fc2gMEtCGImbtj63fNk55s/XnWpRnild7z5Ferw66s1lJJ4Xa+eA==
X-Received: by 2002:a05:6a20:551f:b0:1bd:24f6:576 with SMTP id adf61e73a8af0-1bd24f60623mr6231502637.48.1719471631467;
        Thu, 27 Jun 2024 00:00:31 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e306-713d-05da-7754-dfb7-477a.emome-ip6.hinet.net. [2001:b400:e306:713d:5da:7754:dfb7:477a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac997ed1sm5962145ad.211.2024.06.27.00.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:00:31 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	amithash@meta.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/10] ARM: dts: aspeed: Harma: add ina238
Date: Thu, 27 Jun 2024 15:00:06 +0800
Message-Id: <20240627070013.2509150-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
References: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
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

Add INA238 power monitor for Harma fan board.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 0c4bf165d0b0..7d809f1636d6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -198,6 +198,30 @@ pwm@5e{
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
+
+	power-sensor@40 {
+		compatible = "ti,ina238";
+		reg = <0x40>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@41 {
+		compatible = "ti,ina238";
+		reg = <0x41>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@44 {
+		compatible = "ti,ina238";
+		reg = <0x44>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@45 {
+		compatible = "ti,ina238";
+		reg = <0x45>;
+		shunt-resistor = <1000>;
+	};
 };
 
 &i2c1 {
@@ -224,6 +248,30 @@ pwm@5e{
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
+
+	power-sensor@40 {
+		compatible = "ti,ina238";
+		reg = <0x40>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@41 {
+		compatible = "ti,ina238";
+		reg = <0x41>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@44 {
+		compatible = "ti,ina238";
+		reg = <0x44>;
+		shunt-resistor = <1000>;
+	};
+
+	power-sensor@45 {
+		compatible = "ti,ina238";
+		reg = <0x45>;
+		shunt-resistor = <1000>;
+	};
 };
 
 &i2c3 {
-- 
2.25.1

