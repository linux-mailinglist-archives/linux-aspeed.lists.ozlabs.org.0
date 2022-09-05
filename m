Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D6C5ADC14
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 01:57:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MM56937VVz30FQ
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 09:57:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CYxNR3IM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CYxNR3IM;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MM5661shNz30Mr
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Sep 2022 09:57:01 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id o15-20020a17090a3d4f00b002004ed4d77eso4272962pjf.5
        for <linux-aspeed@lists.ozlabs.org>; Mon, 05 Sep 2022 16:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=jfgoG65m8y92e/I+R1FFZjCqYowE45KYPw1MG3KYwPc=;
        b=CYxNR3IMSrHOPWsxZDepJUS65bRt7H6VcpeRt6MM10aBzWg18CnbBImh4Yyi9KLWw8
         TCcKEKkFMN+ZT8bfJ1xJ7lOYzEM10+4b0CtDytAZ6kI6X7zpYchrxlos4bEG3pUIN3IJ
         QFW1ERQC+oOoGlwAZVoByqoM72Vc8EnTN0xwkARrR6/0+U9GudrnHmj9wEwXiO7nUH7N
         s6k9XUHi1UPZBVqjSRcUqeGs/bZvK8doV1RXnUn9P1Hs2RYa8p6ZtPptwK8w2cL9HsJp
         WGAiarK3Y8av7ozoIkdBB2xHK3L+sRVsNwYqPkVely/kzpWstBARDbYEGBPuag7QbyhD
         MXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jfgoG65m8y92e/I+R1FFZjCqYowE45KYPw1MG3KYwPc=;
        b=PhYEeCNcUHeMqexAnRWPBig5nviEkwB4C3MNRluuSgk0fmxUZFNjh1nPRVFjKdBZN9
         4OySPxnd5q4V6m4gN4aG8trzkZz8YQ41QdwgmjT2RoxDRexx5hlYaPJdsZmDRwKMK5YY
         mgKz9Xc8TCBO8wAT95o7T2G4IlogvbEVu5qC8AStPMhnUywoCjLZ1S4+EPgZiQSLlBJf
         2lNZzTDcxK00RV6rXbsBv6cCtFl7iqdHe/ocpjfQ1EG/jHwOq19HPSp7ZEoYhz+Ac4G0
         Gt7yqEnMVVhnQKi/BRwmzfj+K6H4WdilTFq9IAOvk8HPjek3nk574QUAByKdIkogGqtH
         7riw==
X-Gm-Message-State: ACgBeo1VrXD9QtJ0WYXMfx5af5bEXMDCIcvTkrr6Zb7l5Fc18Hb9RI4n
	/W89M9hsx7hdg4Dg7HMnXgI=
X-Google-Smtp-Source: AA6agR5GLHFYb6BNlPh/lb13Sdr8yCGnsYNTWWtx0r29gyDFpyv1zsHWc/cDmHgS4l3hGgJz5T39yg==
X-Received: by 2002:a17:90b:1804:b0:1fb:141:a09d with SMTP id lw4-20020a17090b180400b001fb0141a09dmr21524677pjb.170.1662422219891;
        Mon, 05 Sep 2022 16:56:59 -0700 (PDT)
Received: from localhost.localdomain ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id g26-20020aa79dda000000b00537f13d217bsm8405530pfq.76.2022.09.05.16.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 16:56:59 -0700 (PDT)
From: rentao.bupt@gmail.com
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heyi Guo <guoheyi@linux.alibaba.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Guangbin Huang <huangguangbin2@huawei.com>,
	Liang He <windhl@126.com>,
	Hao Chen <chenhao288@hisilicon.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Tao Ren <taoren@fb.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/2] ARM: dts: aspeed: elbert: Enable mac3 controller
Date: Mon,  5 Sep 2022 16:56:34 -0700
Message-Id: <20220905235634.20957-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220905235634.20957-1-rentao.bupt@gmail.com>
References: <20220905235634.20957-1-rentao.bupt@gmail.com>
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

Enable mac3 controller in Elbert dts: Elbert MAC3 is connected to the
onboard switch directly (fixed link).

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
index 27b43fe099f1..52cb617783ac 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
@@ -183,3 +183,14 @@ imux31: i2c@7 {
 &i2c11 {
 	status = "okay";
 };
+
+&mac3 {
+	status = "okay";
+	phy-mode = "rgmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii4_default>;
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
-- 
2.30.2

