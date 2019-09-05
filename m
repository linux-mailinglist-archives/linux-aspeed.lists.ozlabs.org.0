Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2373A9771
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 02:02:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P18q45S6zDqws
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 10:02:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IWuhtQSa"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P18k3jZ0zDqvR
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 10:02:30 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id 4so354019pld.10
 for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Sep 2019 17:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qnsUfUbtBKZB2rj/akmEHA3OVRPrL9BVtYGuRABAW/8=;
 b=IWuhtQSa8LLMNw62XbtmPHsyHojsXEO+c1aK6SvYzjVWQOQHEQ1bSNGGvXeiNnjSQ1
 xG2e0RbPt7I8NSsudOJeISNDRSzwTPExDCI22j3FcYy3RYPHGDY1kInaTSkyjBrgGanE
 B3cpMmL92U5NpUKfhygmT3R9nB6a+TwFO1w28JZmP9nSR1qsQmJNLcqzJiL7B9ukNqmR
 90W5CeKmukinELSvaC9Q4GyzUFA3VB+hr5x2fL9SRmYdk7K8/oqHft444dbPRvVZnMle
 ccZqoIdm976qwKDheCViTC+73WV7UvUgPet6GYDrYCMOI2REDwnGIcFyl+O60BUUbPEQ
 oaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qnsUfUbtBKZB2rj/akmEHA3OVRPrL9BVtYGuRABAW/8=;
 b=lAx3JcuYR7b7lC4RVHeomLH1Is+kYENJTqRFqARBpqTxD7Yg3gIfbT/ysACqjs2cL1
 swK1mg1FxZ1J5ZgtbL+wUwavfqmcIOrD90uQHZoyozFIAP8lfCbhtE7HpEtrGVBusB/s
 +ZGgcxdoVtMEYAKhd7CM5rjwFaR4fcmcT8MfiMn+6512nhdiMVZb+BoVrIjcKmWE1VvR
 wf79K9cRatNhdzLOJm0NEk3yMyxeAKIP8aMczkyn4LZL0B2lhDw6PYrQ8H9fwBWZZQ6o
 U6tfxSrlgi/0b22wuBGXqZrTKMfj15szLUZKMSLBnLf/ilOlEYt/e78wJYzreG/rhR+2
 T3mQ==
X-Gm-Message-State: APjAAAXUjXlzovoPxFfE60UgzwDIOci9ai2wZ+16m+K7VZWc74afyLn9
 z0LsBaOHnwfPlAe16foCQcs=
X-Google-Smtp-Source: APXvYqxgMGuDzrKLSwYZca7Z9ikDN/d2nWwjNF85p9AHhfEtCj3dD1a+HJIdLBiRWfU/a0640prJbw==
X-Received: by 2002:a17:902:6bc5:: with SMTP id
 m5mr402172plt.169.1567641747978; 
 Wed, 04 Sep 2019 17:02:27 -0700 (PDT)
Received: from voyager.ozlabs.ibm.com ([2a00:79e1:abc:100:6ba1:43a1:a8bb:9b57])
 by smtp.gmail.com with ESMTPSA id i1sm213139pfg.2.2019.09.04.17.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 17:02:27 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] ARM: dts: aspeed-g4: Add all flash chips
Date: Wed,  4 Sep 2019 17:02:20 -0700
Message-Id: <20190905000221.31445-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The FMC supports five chip selects, so describe the five possible flash
chips.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index e465cda40fe7..dffb595d30e4 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -67,6 +67,26 @@
 				compatible = "jedec,spi-nor";
 				status = "disabled";
 			};
+			flash@1 {
+				reg = < 1 >;
+				compatible = "jedec,spi-nor";
+				status = "disabled";
+			};
+			flash@2 {
+				reg = < 2 >;
+				compatible = "jedec,spi-nor";
+				status = "disabled";
+			};
+			flash@3 {
+				reg = < 3 >;
+				compatible = "jedec,spi-nor";
+				status = "disabled";
+			};
+			flash@4 {
+				reg = < 4 >;
+				compatible = "jedec,spi-nor";
+				status = "disabled";
+			};
 		};
 
 		spi: spi@1e630000 {
-- 
2.23.0.rc1

