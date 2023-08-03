Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA97776F5EF
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Aug 2023 01:03:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fDdnhKSG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RH4CY41bSz3cNZ
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Aug 2023 09:03:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fDdnhKSG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=rentao.bupt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RH4CD4lsCz2ydR
	for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Aug 2023 09:03:36 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso990941a12.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Aug 2023 16:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691103814; x=1691708614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCqXZ3aIK41APZmJUyJtIADVAZfdOyyUdWhlq/zah+A=;
        b=fDdnhKSG4bsPDkze8O0TyzQZbYZp6PewHRUfNahc+nCM4/zHnU/hC33jgPCn8WxNGI
         PanrrHiN2ixafjxeVoWpUTdFgrePLV5gljn6hX41bIvgcyVDvYdy9XdEa8pJU6hb8p91
         825Npwd8BrAs603s0OCIFp3X0lc1NvYzCIULip3Nu7I2+n4zfoFsJVAL0uKGqS8WTL6G
         F1Pos0eVj3+fxcFo1XvpMnHv8NS/0a2uJwr1ULwQoq3UzFKmu/HOuh/0VoAkS0xmaKZ/
         aYTcwtExKf8TMofcCaOzFse9RiByWN0X9J+52yaIupkdwp7d/FyXlocqIpbB1pb+iJKi
         pidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691103814; x=1691708614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCqXZ3aIK41APZmJUyJtIADVAZfdOyyUdWhlq/zah+A=;
        b=LkPK7/Y9pOaJBs7Xhm8yoWbGTPsLp15DJIUCyqjPRaPt1kxk1qH2jjszdaj8IZRoZ7
         8aaMmMSjpSzAEh2320cWZFzjIws1P5kszs0u15T1DazNlCjlNBtQT1Up1wEktCLeR8k6
         4xJObO6WXsGKNkMbI05yy5dlZr2ezMXTO/IdKTkGwdbs9hjFker4DgxacTrIRSHWXvwO
         wWYZn+HYBuM1l97G9slfN7Y+8F43odzRm4zeKVsFzabH78uIKVR3q37XtHCq4KGRCv/z
         yL6AZggZl52ZBrU58hP/wJ41Ixhc96mMD8Wl5P01dL0tpK2u+cVEHRdpUfVbReBMtmS2
         WyoA==
X-Gm-Message-State: AOJu0Yxcysgc4aKFZVUdvBHdJdYc1N5h2ctx6+hnCLtvyZlrQaXismSq
	rCIMOcBaCJhOiN3upCxiSwk=
X-Google-Smtp-Source: AGHT+IFw83JkMH1zRFqh+nnFbGXM33XYKbnbZ7+OTETUvcthEPrk5UoB/wpJrlNmpd81eYTIu+evLw==
X-Received: by 2002:a17:902:7d91:b0:1bb:9c45:130f with SMTP id a17-20020a1709027d9100b001bb9c45130fmr94201plm.69.1691103813895;
        Thu, 03 Aug 2023 16:03:33 -0700 (PDT)
Received: from taoren-fedora-PC23YAB4.thefacebook.com ([2620:10d:c090:500::5:e60a])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090322c700b001bbb598b8bbsm372349plg.41.2023.08.03.16.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 16:03:33 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	taoren@meta.com
Subject: [PATCH 2/3] ARM: dts: aspeed: wedge400: Enable more ADC channels
Date: Thu,  3 Aug 2023 16:03:23 -0700
Message-Id: <20230803230324.731268-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230803230324.731268-1-rentao.bupt@gmail.com>
References: <20230803230324.731268-1-rentao.bupt@gmail.com>
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

From: Tao Ren <rentao.bupt@gmail.com>

Enable ASPEED-ADC channels 5-8 to support voltage monitoring of all the
Wedge400 hardware revisions.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
index ed305948386f..5c55afed946f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
@@ -59,7 +59,8 @@ chosen {
 
 	ast-adc-hwmon {
 		compatible = "iio-hwmon";
-		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>;
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
+			      <&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>;
 	};
 
 	/*
-- 
2.40.1

