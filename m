Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C29C858E472
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Aug 2022 03:21:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2XFg04HNz2yMj
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Aug 2022 11:21:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K5ZL9QYO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K5ZL9QYO;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2XFQ1fxyz2xZB
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Aug 2022 11:20:57 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id 130so12304613pfv.13
        for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Aug 2022 18:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=K8PB1ciS662o1jhXEW/30/xnIB1fBOdqWTq+opSx6m8=;
        b=K5ZL9QYOWSZsR/ShTSrILo4k4ZAWTcKhdo8r/L9sgegOaH4Kagm2nvicjb/KBScaoa
         OxQHtMrxRnj1OPOH0sxeqCkQG5k6Lt0Gy+zXx55QneuNCTN+caP02M/Pme2oHr9f+UjF
         vJtcfBZLC5PMA5ENvK9lrwI8cDkPMlK7GWCOFX+Ovjoys0DY9S3E0aaQ3wlunzRE0l59
         0xlK5p0mzbkuPId9nt9BEkPgDCQTJbIGQ+ttogMkxVGmjWGNcJZuo6XOxwZlh/PxrcHl
         d/l1FPhk0mgA2mH/EZIPA4LL3B2P40QcoO+bURitbAtJ3FiIThP06msuHcUSi66iecbx
         LHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=K8PB1ciS662o1jhXEW/30/xnIB1fBOdqWTq+opSx6m8=;
        b=axeVTnT+3yRXbSBCOIt5zlGyRn6DPO2vqlKna8W45TWQBTaqMfQV1CIu1a643inyyg
         oFGEPRG2d6dMNqmVfnay4JTjdykCakcf01P2dUQtxkFuClzlmii+Z2nfhhmICK3KSv/B
         rm7JinbKw/tvJtdg5tjwghMh59xJgD0E9RQl/AgjPZmYG0T3L7b1VyDQUgeQxqKxQIhy
         6zaEu/Qd4DCDdGl/Q/h1EntclNU3bsEAiyZj5OWsGIaouQ7ba3GqYvcjnpptgLXoop+T
         GlHTSEHJsIrkh47NN28db42aE2Gvyd6ivrWu56vfe9RSieh6FZu+06pSYaSFfjtYIG9p
         tTvg==
X-Gm-Message-State: ACgBeo1kuPSGDDvUEx1dsuELAZFItnwMXtsVbZHYfrmD6c6xPcPsQ1cx
	twVgsgdtA+vdxEMCzksBqZ8=
X-Google-Smtp-Source: AA6agR4GqR70FuMvJ7suELLr5AKo8xKVh84iqXtuNR07KxSiTtk66QetWIgLvl0R1XQOM1kT482y0g==
X-Received: by 2002:a05:6a00:1948:b0:525:45e3:2eb7 with SMTP id s8-20020a056a00194800b0052545e32eb7mr25750251pfk.77.1660094455911;
        Tue, 09 Aug 2022 18:20:55 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id s18-20020a170903215200b0016c3affe60esm11356754ple.46.2022.08.09.18.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 18:20:55 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/2] ARM: dts: aspeed: bletchley: remove hdc1080 node
Date: Wed, 10 Aug 2022 00:43:38 +0000
Message-Id: <20220810004338.329832-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220810004338.329832-1-potin.lai.pt@gmail.com>
References: <20220810004338.329832-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Because of incompatible 2nd source si7021, removing hdc1080 node from
devicetree, and move node probe to user-space layer.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 54c9f182f6a5c..1f72017c1e2d9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -882,11 +882,6 @@ tmp421@4f {
 		reg = <0x4f>;
 	};
 
-	hdc1080@40 {
-		compatible = "ti,hdc1080";
-		reg = <0x40>;
-	};
-
 	front_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
-- 
2.31.1

