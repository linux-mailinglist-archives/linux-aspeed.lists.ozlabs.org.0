Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4CE60C381
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 07:52:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxLgM1MZBz3byb
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 16:52:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Gi0LqGuj;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Gi0LqGuj;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxLg96RjZz3bcY
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Oct 2022 16:52:04 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id w189so9458051pfw.4
        for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Oct 2022 22:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hIosgv5purvdOHjHB0Bdm/xsYrKIRMZ14fsco2UYxnk=;
        b=Gi0LqGujeeIHDVQVa56iRgjW+CI3P/VaODt++d1WhDW+E0Ql+uw8P7QiLdb5EKVxtU
         /buJsSr4XGFfPVSn7bFH4r0seo1W1Y3V0D+O2p+hV4jFqX+NUK2d5zkFrFD+r0KKH0SC
         lAz8b3loolLsYJC277CGRf6khkO3AF9WYUoQPdv8JCpvx+PAGSa0YQ3hAaefocawFLIX
         h08NMopijzftxPlUZzLBC1fZmGjdZmsPmFOHFiiTWLPDmIjWAtOe8Y5ZvHap0MxIb7Zu
         KFG6TOPr5uyTE4Et8IeR4w/dbHdTx+foft5trYjehD0l5FSZBrGfAU+QzyfLNwOY64Dm
         rgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIosgv5purvdOHjHB0Bdm/xsYrKIRMZ14fsco2UYxnk=;
        b=nWYoKQUOTPm8dhvAlgUCEmm8fIjvR6zlriUFY8XLfHGK3QZftOEkV5uP/RqRC48VZD
         p60xuNI/P+ui0aikuAN4KPYDvOY0t4duIgQRXidj/6pQjCcycMeV/lbRClzpHILwtZhy
         eJQ1OEW7vDY4hzi44eXwM0pCW3eZu5Uf4Cjvcs+ly1VV8EpNiZ3++tEy5gEVK1OCex+8
         smFmG089Xkux6OGqbZIJiEfgKQQtX/9du1wYfRnlob6MruGbEHDQ7pSlofJAOkCIpiqp
         1CJOWvy7O8JttpsBbHxBsXtw1fBI5JgkcApa5X4pk3E/QlPfwoOYAQPJ38D6icMRRj7T
         7GYg==
X-Gm-Message-State: ACrzQf3+gm8s6XloglQE9kgSBVQlbfD6iLbGeeSLpZDbtXDu89FqEJKZ
	hbRHrtpaYe3/Q5rrA1nwE/Q=
X-Google-Smtp-Source: AMsMyM5Yrz5n05HNZztnB0pQdKPHsHmLKVkt2d8mYs8HXJ1l2cDamvLiDiMe7LXO+RQoeZk++Djq0Q==
X-Received: by 2002:aa7:810a:0:b0:55b:674d:d123 with SMTP id b10-20020aa7810a000000b0055b674dd123mr38050507pfi.52.1666677122845;
        Mon, 24 Oct 2022 22:52:02 -0700 (PDT)
Received: from localhost.localdomain.dhcpserver.bu9bmc.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id e126-20020a621e84000000b0056ba6952e40sm675644pfe.181.2022.10.24.22.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 22:52:02 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 1/1] ARM: dts: aspeed-g6: add aliases for mdio nodes
Date: Tue, 25 Oct 2022 13:50:46 +0800
Message-Id: <20221025055046.1704920-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add aliases for mdio nodes so that we can use name to lookup the
bus address of Aspeed SOC.

For example:
root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio0
/ahb/mdio@1e650000
root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio1
/ahb/mdio@1e650008
root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio2
/ahb/mdio@1e650010
root@bletchley:~# cat /sys/firmware/devicetree/base/aliases/mdio3
/ahb/mdio@1e650018

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
LINK: [v1] https://lore.kernel.org/all/20221025024145.1561047-1-potin.lai.pt@gmail.com/

change v1 --> v2:
* move mdio aliases to aspeed-g6.dtsi
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 0cc92874caa8..6f159ef1efbc 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -36,6 +36,10 @@ aliases {
 		serial4 = &uart5;
 		serial5 = &vuart1;
 		serial6 = &vuart2;
+		mdio0 = &mdio0;
+		mdio1 = &mdio1;
+		mdio2 = &mdio2;
+		mdio3 = &mdio3;
 	};
 
 
-- 
2.31.1

