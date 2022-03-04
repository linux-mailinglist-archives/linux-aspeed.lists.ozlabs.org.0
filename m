Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C41E54CCB2E
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 02:10:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8qXm5L1vz30BP
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 12:10:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IJ0swrJn;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IJ0swrJn; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8qXd24l8z2xXy
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Mar 2022 12:10:24 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id p8so6239118pfh.8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Mar 2022 17:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wL/NSCoP7H388ddvlil8j+YJYi6ash7ezNgkxiwgWlI=;
 b=IJ0swrJnzm09mnOdENnboYPU0mXe5nnMaFOODhd0igitoGEjY2OB+M6XkyKwdelb4b
 MaFoHPhfPtzD2VGDK/7Njzj9JIXAVwr3r9E7T1xyIx4/kzgjXjsCJjeVs+HEhO5mHvmx
 PfQmMnyWwQphbZOr2Lagb4npf4NtPSPkflA83H0VnyyJMFn3PrrtC++iWZzzhjuWX3lj
 cKj8MJmskRLmsOmjODnpuFdXIeGr0PIpcOd2kxhHi/HcmImJgkcleGwGEAvKDjnCg3MP
 fS5jkk+cEHNXKlk+KQpi30OQ9vQKSjdk/ztWmR0p70WFbQQkOXVF6MtuOq4CyEYzSRj9
 tcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wL/NSCoP7H388ddvlil8j+YJYi6ash7ezNgkxiwgWlI=;
 b=o8Ragc1f5IOayHvQuCr/f17rVQGJG8HZZm8za7+M5CHkCaeE08BwH6jeC9ZpeZ58NN
 JdLpB5oncp58vQPkOe9g75Fr9692FwVx9PY12ADVrag3MkpWuXwKQDNXLpYgPnukdRNW
 xdf+fzVmyYjWettM4yrFCFn3qv4ssED1Hk1F+HcRUT76zwCuVnAK6jToNb+iuaRyXNL0
 JKhSlzhA8FeVIeQxtrWjI89z3Y2AjAA62mPsCuACovUTUOlDhw5MAIui0iu6Ud+uZZna
 0Iw4qRAM9dyXP1gRMSQ/XWOo9XPok4UOdGwAGj8WWhNaorgj48CYf2a5d17SqIKWSm1t
 bzbw==
X-Gm-Message-State: AOAM531FrUgsvd5Rgl3/qy5zcDOnbqk6/ofjbZiR6eOp1ndeXccEoeyi
 wC2rOEp/0KTtadxqC6AahQI=
X-Google-Smtp-Source: ABdhPJwboBncI+6LWWacKEp45Ai5uNZhsXYA5RfMj8/mVXJcn6gUkkXxbDOBWWPmAVcL5en7SE9mnQ==
X-Received: by 2002:a63:ab47:0:b0:375:5d05:9f79 with SMTP id
 k7-20020a63ab47000000b003755d059f79mr32569913pgp.192.1646356220418; 
 Thu, 03 Mar 2022 17:10:20 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a056a0024c200b004f6b6817549sm165765pfv.173.2022.03.03.17.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 17:10:19 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] ARM: dts: aspeed: Fix AST2600 quad spi group
Date: Fri,  4 Mar 2022 11:40:10 +1030
Message-Id: <20220304011010.974863-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Requesting quad mode for the FMC resulted in an error:

  &fmc {
         status = "okay";
 +       pinctrl-names = "default";
 +       pinctrl-0 = <&pinctrl_fwqspi_default>'

[    0.742963] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: invalid function FWQSPID in map table
￼

This is because the quad mode pins are a group of pins, not a function.

After applying this patch we can request the pins and the QSPI data
lines are muxed:

 # cat /sys/kernel/debug/pinctrl/1e6e2000.syscon\:pinctrl-aspeed-g6-pinctrl/pinmux-pins |grep 1e620000.spi
 pin 196 (AE12): device 1e620000.spi function FWSPID group FWQSPID
 pin 197 (AF12): device 1e620000.spi function FWSPID group FWQSPID
 pin 240 (Y1): device 1e620000.spi function FWSPID group FWQSPID
 pin 241 (Y2): device 1e620000.spi function FWSPID group FWQSPID
 pin 242 (Y3): device 1e620000.spi function FWSPID group FWQSPID
 pin 243 (Y4): device 1e620000.spi function FWSPID group FWQSPID

Fixes: f510f04c8c83 ("ARM: dts: aspeed: Add AST2600 pinmux nodes")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
index 6dde51c2aed3..e4775bbceecc 100644
--- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
@@ -118,7 +118,7 @@ pinctrl_fwspid_default: fwspid_default {
 	};
 
 	pinctrl_fwqspid_default: fwqspid_default {
-		function = "FWQSPID";
+		function = "FWSPID";
 		groups = "FWQSPID";
 	};
 
-- 
2.34.1

