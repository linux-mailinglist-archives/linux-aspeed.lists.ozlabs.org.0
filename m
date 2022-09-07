Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 116275AFBE6
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 07:45:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMrnS4GN0z3bc8
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 15:45:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n294xEYj;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n294xEYj;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMrnH10bJz2x9v
	for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Sep 2022 15:45:06 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id s206so12597777pgs.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 06 Sep 2022 22:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=MxUjkhck3ThCup5JU1rYOQtyKBWOrj1qhayfFTMHy24=;
        b=n294xEYj18Ngb737eeY0NWR2FiB5hbvUei2t+J5yesyN4dPpRgCcQI5xcIi4MC/r/h
         6+jt4NOnvd3xqc+iQiy/4rDKGUgcvcmOEZP/ukuUUzrQX2hr7ku5EJBu6RXANfcTBX3v
         Hm1auCTam2QnlOGmN//E2ZN2f3Kr66eZQ55KRHqkH8eAuNJOTPE7SMDFGF5z4ba2PX9j
         7wwCLpIbO+HRSLCOLVeHMLgPipKfQDZm75lqTBK0ZFnMsKsvIqkwZgASvLhe+ReAIsSF
         PNy9j4zmR33ajjcv0h5ZntfKQARz1NDjXaZq+A0VJ7QxSRz3c2Ecv9RVBIKU6oBpcw3Z
         cdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MxUjkhck3ThCup5JU1rYOQtyKBWOrj1qhayfFTMHy24=;
        b=SIN3RiO8csaB6mkXW+tBcdMtZGR082fQ8RU5ALmxZEJB6ZpR139OckQQbTNlzOgNZU
         he+KSLCBxiaJPcf470+wy86SmtWZ4PEghV3aoosRaUCFf3C8GTXpRtwBvLrd7PdxS8Q+
         UTe64q6OEVbH67D1pRMpXDGX7RxdZVe0JVd+gaE54j/pzMlWqSCmY1WRjduU5KYAb+fO
         37Uy9U82P5TPb5dSFSB9TsINQKcdsHCVndqtVF8Fd6/BJiuTilzIK+VH/50l3JULRijN
         f6p9c1SYwH6bYum3bXK0BM4492+oPn11PbfbHtXJCELTgXxaShL7Q65VTHtrLMT1P259
         6GHA==
X-Gm-Message-State: ACgBeo3dK+49kcT58P3FMQFQVFt2+WvpR+hIy7B9VhEdI7107FElSPfy
	7igE6ljBugXd7rQt1ai8FsE=
X-Google-Smtp-Source: AA6agR7kbaoNt6zjIBweSiPmfp6LIaSt/m1OzJ7rtVUYJf/gIBW1VZ07ewfRKxRgezbUZstg0VLgJg==
X-Received: by 2002:a05:6a00:4c85:b0:538:5500:4873 with SMTP id eb5-20020a056a004c8500b0053855004873mr2265813pfb.81.1662529504723;
        Tue, 06 Sep 2022 22:45:04 -0700 (PDT)
Received: from localhost.localdomain ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902d50200b0016c0c82e85csm11222798plg.75.2022.09.06.22.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 22:45:04 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
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
Subject: [PATCH net-next v3 2/2] ARM: dts: aspeed: elbert: Enable mac3 controller
Date: Tue,  6 Sep 2022 22:44:53 -0700
Message-Id: <20220907054453.20016-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907054453.20016-1-rentao.bupt@gmail.com>
References: <20220907054453.20016-1-rentao.bupt@gmail.com>
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
BCM53134P onboard switch's IMP_RGMII port directly (fixed link, no PHY
between BMC MAC and BCM53134P).

Note: BMC's mdio0 controller is connected to BCM53134P's MDIO interface,
and the MDIO channel will be enabled later, when BCM53134 is added to
"bcm53xx" DSA driver.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v3:
  - updated comments and patch description.
 Changes in v2:
  - updated comments and patch description.
 .../boot/dts/aspeed-bmc-facebook-elbert.dts    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
index 27b43fe099f1..8e1a1d1b282d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dts
@@ -183,3 +183,21 @@ imux31: i2c@7 {
 &i2c11 {
 	status = "okay";
 };
+
+/*
+ * BMC's "mac3" controller is connected to BCM53134P's IMP_RGMII port
+ * directly (fixed link, no PHY in between).
+ * Note: BMC's "mdio0" controller is connected to BCM53134P's MDIO
+ * interface, and the MDIO channel will be enabled in dts later, when
+ * BCM53134 is added to "bcm53xx" DSA driver.
+ */
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
2.37.3

