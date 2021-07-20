Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 777AB3CF0BF
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Jul 2021 02:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTKKr2z0Mz30CS
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Jul 2021 10:27:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ktfbQ//E;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ktfbQ//E; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTKKj41Fbz2yXc;
 Tue, 20 Jul 2021 10:27:20 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 jx7-20020a17090b46c7b02901757deaf2c8so1480404pjb.0; 
 Mon, 19 Jul 2021 17:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3paEF6uTPtJuVzcwEbmMICexqBa0ixV58zFe59FrapY=;
 b=ktfbQ//Eqk+xDPMBGC1lTN2dtljdcf913wD8dC1G5WKjaoXy7LOb98VnRAAatZoOK6
 39evXxJhZb+WrBgC9zww25iuAy0k6XgY5Q8e2msG844n2c3eEuEXS/bIR/S1vUbFj4st
 kmmMrXedAdfoBk3LO/uBh7dw8I48PI/XXE4V+xCPa4qBV8hqRQXI6L1O2ddTdmJYuSQw
 NQ9ULnb6qseP4jkZjIAWzGYxw/Mv90VnKOm2bJ/oQka4GDmDLobqFJ5p5WElTvKleBba
 hjuJMIDNnDK1wk5rye8fmmCXCMZAcQJzDO7d3mzIwoBv+cwk7aStIzPxD1+ZAqCTduO5
 hfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3paEF6uTPtJuVzcwEbmMICexqBa0ixV58zFe59FrapY=;
 b=Jgo8wRYs/TlwF9IX884t/U+JtSsJ1l4GTQf24S1RSj/PUutXGr/RafDgD++g8/5on5
 dJR1AeMEuIMhKleXEms84KyMozXzprOPA03kGjEwxIt/gQqepschRnoEs+17SiXzMv4F
 8vrxMidJX6E8LrDoQ7PZeOI5oZjEGjHujf5Yte3tF6Afc7jRPpeNvpgjyl/A8cBGfGWi
 C6WMHjUOLQikl3GVokEEjdjbRKHHOzWgq2L+TlaU5AZRNFdEP0dGO3yi/98XKHwc1FrL
 50QGyVz/KEEz/NdClGX01ntamgzPint2XMlFcSgM4KaQnxD37CiaxvXhXKc5zeSp3lNO
 BbZQ==
X-Gm-Message-State: AOAM530NpdrTx2gZSZ0P+vWxN0oFKwHSFXMsRI/cBo01Aft+aBrBSqh8
 NGudee3WrVddPdOWh8bQU4c=
X-Google-Smtp-Source: ABdhPJwjzsszQsBR/i6spF9ryPzXGmISj7B/mjK51ISfM0a2Zus/cLUb79kBXN2eQdHys5ZDUgXwqg==
X-Received: by 2002:a17:903:1c1:b029:12b:1eef:fedc with SMTP id
 e1-20020a17090301c1b029012b1eeffedcmr21371916plh.17.1626740836970; 
 Mon, 19 Jul 2021 17:27:16 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id x7sm11941831pfu.158.2021.07.19.17.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 17:27:16 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH] ARM: dts: aspeed: minipack: Update flash partition table
Date: Mon, 19 Jul 2021 17:27:04 -0700
Message-Id: <20210720002704.7390-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Update firmware flash "data0" partition size from 4MB to 8MB for larger
persistent storage on minipack BMC.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
index 9eb23e874f19..230d16cd9967 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
@@ -265,19 +265,19 @@
 		};
 
 		/*
-		 * FIT image: 59.5 MB.
+		 * FIT image: 55.5 MB.
 		 */
 		fit@80000 {
-			reg = <0x80000 0x3b80000>;
+			reg = <0x80000 0x3780000>;
 			label = "fit";
 		};
 
 		/*
-		 * "data0" partition (4MB) is reserved for persistent
+		 * "data0" partition (8MB) is reserved for persistent
 		 * data store.
 		 */
 		data0@3800000 {
-			reg = <0x3c00000 0x400000>;
+			reg = <0x3800000 0x800000>;
 			label = "data0";
 		};
 
-- 
2.17.1

