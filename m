Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 941F6919FD5
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 09:01:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SkdwTpRo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8qHC0CCgz3cW7
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 17:01:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SkdwTpRo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8qGS3pkGz3cZK
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 17:00:48 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fa244db0b2so39370875ad.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 00:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719471648; x=1720076448; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9MVRVw78cAnGxBai+z1t3GEr8C1bFmf/TOYviQnigs=;
        b=SkdwTpRoEDENTPf+7Hx2rIEan7D+VnEnddWGAb2J32tIxWOU/ojg4gais7JEh6EBsR
         eTebFfGRmerKfCLpe3PMb9EugNPWW07xmM0LZAKSPpetX38NWuPx5aeOez9Tal+g0wNf
         5F9AXC6A5zN9t6aayOFR2OGuZSLhaVO6vPisERYf1eBTbkNG9/mg3vpEn5MNDst/IHzX
         22t6x7XnR/wEkiHeebTl9k9ZHOHJfYVr6uc6p1rItsyuwPLOFA45AsX7XNckXm7Wm7zH
         wzpc9mOZwn15ZccDiL5698wTaGFIh3IQ5sSnVcSETgDD1urDFfjTkyxYmKI0MPL3b5wq
         5UeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471648; x=1720076448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9MVRVw78cAnGxBai+z1t3GEr8C1bFmf/TOYviQnigs=;
        b=JU4MuXf/dFjHm9zRh8FJ+NIo4Ew8024b0YAQB2FMcguhnRyYVqOTrZB0Elo5PBVwfl
         +X9S/jTcCXEgu+PLcKs/tT84KFDbJdjen6YRrFZux84wzhvcz99PR1/BlH33g7pFToLW
         ZNOrNZcxnk3Ke6vkRK9nVYsIOMHfe6B9UXEZTPp8njaGMXv/aSOQHrXJKWtReYKinF6b
         dWjmJbGzCvZXVdWZp1u+jTuXddiD2mIs10wwKd2otL8bDwLCe22JOmxpC0mWIv1WmQ90
         +K70XGVzTnEtiuitqKxL59s8lBbSDDHT2WuehZNd3hDCGYdC6YrJ0bJJR8DfOpGJw9o5
         XGmw==
X-Forwarded-Encrypted: i=1; AJvYcCWHhXzLIiC3j3QVoe5XwLxFuEOuzjOS+k+cIxgc87C280BUaaV+LvOfl5+biYOnxszV3WBQo5rUdkL3N3Y/3gbHEl4gREnU/esJMzcytQ==
X-Gm-Message-State: AOJu0YxVhUeSI/jXWIbUc30pc4j0tZUxjDALYFax7E9nBFm8F7QZ8MP4
	gsbcAAaEgn904Vll8QIwaYtGQxChfYbt75raqOYTKAZDSxIPJ3GEpoAgBg==
X-Google-Smtp-Source: AGHT+IGXmY3tDD4kOoK590b8I1gWP513ZKXgFYDLyB6WZ9qTeS1eg//qn2jcgZjuPF1yVeQ0Bm3g2Q==
X-Received: by 2002:a17:903:32c4:b0:1f7:2a95:f2d7 with SMTP id d9443c01a7336-1fa15943813mr148693425ad.59.1719471647926;
        Thu, 27 Jun 2024 00:00:47 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e306-713d-05da-7754-dfb7-477a.emome-ip6.hinet.net. [2001:b400:e306:713d:5da:7754:dfb7:477a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac997ed1sm5962145ad.211.2024.06.27.00.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:00:47 -0700 (PDT)
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
Subject: [PATCH v2 09/10] ARM: dts: aspeed: Harma: enable mctp controller
Date: Thu, 27 Jun 2024 15:00:11 +0800
Message-Id: <20240627070013.2509150-10-peteryin.openbmc@gmail.com>
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

Enable the mctp controller in i2c9.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 0455475fbcff..0dd0566bbf27 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -382,6 +382,14 @@ &i2c8 {
 &i2c9 {
 	status = "okay";
 
+	mctp-controller;
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
 	gpio@30 {
 		compatible = "nxp,pca9555";
 		reg = <0x30>;
-- 
2.25.1

