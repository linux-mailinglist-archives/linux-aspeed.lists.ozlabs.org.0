Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7BF271925
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 04:07:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvnrB504pzDqjX
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Sep 2020 12:07:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lyxoQR+A; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bvnr452HnzDqVQ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 12:07:00 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id 67so7639881pgd.12
 for <linux-aspeed@lists.ozlabs.org>; Sun, 20 Sep 2020 19:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HIhrg8tRGQCxs5Sa82o6WHubo3OlUJFmsl/2L8gztn8=;
 b=lyxoQR+Ao9x0xiif06h+tX8QOL6mOMA4PDtcmGkhyz0jxbMZVZm7cWYpoTDfcdOsIO
 0gLXJ968InT1eaABy2dM8+f5zKlZEiP8Xa3x+6Uf1y+M2KB3zFAvURzSfvreq41LzjSr
 9nagE5vtvcAuq6lpYbYzl9M8cbERmDCG/rzMU11Ur4p2FaHX2sUT4vWLbT5WB6gVxUbT
 tauZBur3bIUrH+gRiFQ8p2kaluaD5axAQCqeBo46iAP73bLETE0WoASUovgvhDJVczKa
 i9yux8lcjSu2WLms3WxE8AwxjGNoRvhg8m7sH135io1cr8dFIThPxzILy7paDqKZbJRz
 RgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HIhrg8tRGQCxs5Sa82o6WHubo3OlUJFmsl/2L8gztn8=;
 b=QaMZpdQY5H+cwOfrUBvJV+9AUe8y7GZ4HgDDRJid1+CcJipi3iGrYPrJEJ+UCqvJH9
 V6w97Ca3OeWlTt903mzXn+Z+L1cCH5HeB2DywyxJGgyM6lJcXQ0Dsq8T6MATYJQir5F7
 mH4b2jmy/39InL0qyzIJmy1W5mv+qxhF5omdwyb1C61R2k/eR/bxGAT2b3s01i/6V9Z1
 bzzE23OMds1sdeEc8CB+ZPovcvGZVtURyc4UPlB3xvlVctj3IciVwex4Ju32HCMY0g6O
 kVctGvI+s5bQoX0CuASN1sIytGrkaxEZTKGETQyLRIBhkSbJlE4fup1Lrx5VxWE67QDA
 ignw==
X-Gm-Message-State: AOAM531+NBWDXmac8+RGfGzQmdi+PWoqIYF7i9jcq7UsBoHkytJQp2Li
 HyEw8A990oajlo/qX9ii7uc=
X-Google-Smtp-Source: ABdhPJy9t8RyEtqlAcLk2Q8R6/zPQ8pcWiY6jdFQHUs1V/CTgBauVMKulF8UdUUDYgscZ7e9tmJ+eA==
X-Received: by 2002:a65:4984:: with SMTP id r4mr34722285pgs.261.1600654016532; 
 Sun, 20 Sep 2020 19:06:56 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id z23sm10212045pfj.177.2020.09.20.19.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 19:06:55 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: aspeed: Add silicon id node to SCU
Date: Mon, 21 Sep 2020 11:36:39 +0930
Message-Id: <20200921020641.48733-2-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921020641.48733-1-joel@jms.id.au>
References: <20200921020641.48733-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Different ASPEED families have various unique hardware silicon
identifiers within the SoC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Fix 2500 string
 - Be explicit about which ast2600 register to use
---
 .../devicetree/bindings/mfd/aspeed-scu.txt    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
index 4d92c0bb6687..857ee33f7329 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
+++ b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
@@ -20,3 +20,29 @@ syscon: syscon@1e6e2000 {
 	#clock-cells = <1>;
 	#reset-cells = <1>;
 };
+
+Silicon ID
+-----------------
+
+Families have unique hardware silicon identifiers within the SoC.
+
+Required properties:
+
+ - compatible:		"aspeed,silicon-id" or:
+			"aspeed,ast2400-silicon-id" or
+			"aspeed,ast2500-silicon-id" or
+			"aspeed,ast2600-silicon-id"
+
+ - reg:			offset and length of the silicon id information
+			optionally, a second offset and length describes the unique chip id
+
+			The reg should be the unique silicon id register, and
+			not backwards compatible one in eg. the 2600.
+
+Example:
+
+
+silicon-id@7c {
+        compatible = "aspeed,ast2500-silicon-id", "aspeed,silicon-id";
+        reg = <0x7c 0x4 0x150 0x8>;
+};
-- 
2.28.0

