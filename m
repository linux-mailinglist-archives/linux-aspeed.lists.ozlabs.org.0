Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB2995848B
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 12:31:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp5NN1zkQz2yNB
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 20:31:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BcDdXust;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp5NK38V3z2y33
	for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2024 20:31:13 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fee6435a34so33564395ad.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2024 03:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724149871; x=1724754671; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24ONLHDIg4IPXcssauearHwBYBXH9GZM3HUtiuvktw0=;
        b=BcDdXustvq9201LurjSTVNJ+M8jkIKhoatHvfaJ17um6+7+aJqWmLl4WiQS5p09wJY
         14j4lCNclexPn7hLGNWGSE+WTFTg7fmXmYC7miLOq4ogiQX4kAzRnDg4PvYy/5uL/SEE
         SA0eCgrNOUp/8cgPk7o4l4CjW7p8zlsUESbXe890K+QzzGWVdxMmCi2iWsOfpaE3shuM
         WtdgW0EFoX2FBxdJxlg8W59sRFUoVqb7LRfUcpOoTG0YIsOHgV8OK5S48YHEBkcvm2LR
         ulIcClEx+1/ZoJIyysz4qP3L/LCB6SXB4rzNoP97N5I7huNwf/Iws+yo1izOm4/Zk8KK
         2WRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724149871; x=1724754671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24ONLHDIg4IPXcssauearHwBYBXH9GZM3HUtiuvktw0=;
        b=Y6P79yma9Rsm382o+yhhiYZdS+x2R8NgrsrzZIqBsffUe/fI1QkXsBCFgniuR6hU1Q
         BFHBlfD22RM1rDrhvh/qdRTZH14MguEbl/SlMmnvKe3SkajMlLqfVXGUe8TRDuCjt3nj
         NT1/FnPtghyRA3k2nSvvP785ZXEEIeVTXbJwvgjgVWjJVuv5QQqfz8w1JD5y4qrKbJEb
         fVwnH7U47KRj2beuKDLoLeWOhQ63YAcej0d5N/iSRCzuzVFJE9SWwsMi9C6DRZpnv7CF
         EAiGNNv1LPEspRM2YfZMt/caqrVlFiywGYTY3FaelAm/KsjCkHqKTinUtCLUMtI4uK1n
         S7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXxnfrBK6gou7eqOpM/XMKc0d5k0J5YWNAb88hJiCqLOYQ+s6QlyKU2P++utYKVhZIxEhBm4ia/E9ImlMY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/n0vbp/LQ9LN8bN9d/nId2rfP6dt7XQ5w+kDwiPf1HgFid3va
	kdNIX3T4f4YH8wkFoGGBiBjckBWMJ0ItP8GKwqsr/xhToWtZX7Fm
X-Google-Smtp-Source: AGHT+IF34yvCZ+WaAxx8Rz0TTX7mD5iF01qeopb0BCg3H+ioPzaZt5thGHcQz8juaF/35r7N5SVxlg==
X-Received: by 2002:a17:902:ec88:b0:202:2ed:b3a3 with SMTP id d9443c01a7336-20203ebecd8mr104218515ad.32.1724149870867;
        Tue, 20 Aug 2024 03:31:10 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f02faa5dsm75444115ad.2.2024.08.20.03.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 03:31:10 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ARM: dts: aspeed: Harma: add rtc device
Date: Tue, 20 Aug 2024 18:29:02 +0800
Message-Id: <20240820102904.1756785-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240820102904.1756785-1-peteryin.openbmc@gmail.com>
References: <20240820102904.1756785-1-peteryin.openbmc@gmail.com>
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

Add "nxp,pcf8563" device and the slave address is 0x51.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index cf3f807a38fe..92068c65eae4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -135,10 +135,6 @@ &mac3 {
 	use-ncsi;
 };
 
-&rtc {
-	status = "okay";
-};
-
 &fmc {
 	status = "okay";
 
@@ -506,6 +502,11 @@ imux31: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+
+			rtc@51 {
+				compatible = "nxp,pcf8563";
+				reg = <0x51>;
+			};
 		};
 	};
 };
-- 
2.25.1

