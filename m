Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B55145AFBDD
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 07:45:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMrnM4Qryz3bc5
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 15:45:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EM8MHwat;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EM8MHwat;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMrnD5NZNz2xGx
	for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Sep 2022 15:45:04 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id v4so12562250pgi.10
        for <linux-aspeed@lists.ozlabs.org>; Tue, 06 Sep 2022 22:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vc+9lhZdvHGipmJiQR19DK5It5RgAjYlDgcsNDiBYQ0=;
        b=EM8MHwat55nL4Wjn4+ya6MxNTraM9ElIKbCMnpkCgyrNM7kPFcj2J4e2SlrDK5a/U2
         1AmHYLeIRJP/eopqpa6mzwjvFjOfyVd9l4zP5lPBh69ZCn6YF5zUTclM8HqcAOedibJ7
         TkLDCP1+ZzTxIH4gGugzDDozIcU5CJnqmFhfMWdIR1Wgjg/KvCtBsMjnm+Edhap8ee5a
         R5jaNIKv2Jy7yRfFFBgadZVSKI01j3aM5I7iiSRwanDfC19uG/z8P1wGRO3ST1XkTNi/
         0tLEvLiH1ZyLYOfyjtSzjkkdzPNvFozpLWVowbrxgJTHkOWiAhAFDvNsqaFDdkFLAi2r
         dnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vc+9lhZdvHGipmJiQR19DK5It5RgAjYlDgcsNDiBYQ0=;
        b=Ylrm3FsPTvmSVFZNQ7QUnqkYByJNoGlql71m+rdMLBtWWrVaOCscT/wSZIkIA99iyS
         49qD6MHSBpAUntexIFQ6LvvfGeDlF7c6J2vXQ7GDDl36X6mnCH30NYUzND+dcVYJmyx6
         gxfkEC1gVb395oACULe0gZZo2yFYPRsrgYugWZsoljV8La0yTQjQ+UyWskQ0x5/OMzsk
         46GUHP2xQ6B4oJr22HE6ESrayRzYdyk+aHc9SUU3Vw6YpN7TKRiDMGviz6v2vbFBqLOU
         AB7Of7A3qhvF0M6nZJX0G75kb5pdb2HrnTIfdUMolvlJSvim2rypZ8YbzO5tdN5chDg3
         eVYQ==
X-Gm-Message-State: ACgBeo0t1l0ozcO6jOTJPFc9uiy5yRvg1aYGarbv5Kb+BYz3WvoRGHso
	I94tGruANYV+cmnaGepemZQ=
X-Google-Smtp-Source: AA6agR64WB1uKVsnb83+o3qiFDrgAfqg4TmB3M18AMQi1RgPJhea91VyXpDVcMspPl4mWCNRguOWow==
X-Received: by 2002:a63:c003:0:b0:434:dd62:18e1 with SMTP id h3-20020a63c003000000b00434dd6218e1mr2020043pgg.53.1662529502321;
        Tue, 06 Sep 2022 22:45:02 -0700 (PDT)
Received: from localhost.localdomain ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902d50200b0016c0c82e85csm11222798plg.75.2022.09.06.22.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 22:45:01 -0700 (PDT)
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
Subject: [PATCH net-next v3 1/2] net: ftgmac100: support fixed link
Date: Tue,  6 Sep 2022 22:44:52 -0700
Message-Id: <20220907054453.20016-2-rentao.bupt@gmail.com>
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

Support fixed link in ftgmac100 driver. Fixed link is used on several
Meta OpenBMC platforms, such as Elbert (AST2620) and Wedge400 (AST2520).

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 Changes in v3: None
 Changes in v2: None

 drivers/net/ethernet/faraday/ftgmac100.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 9277d5fb5052..da04beee5865 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1701,10 +1701,14 @@ static int ftgmac100_setup_mdio(struct net_device *netdev)
 
 static void ftgmac100_phy_disconnect(struct net_device *netdev)
 {
+	struct ftgmac100 *priv = netdev_priv(netdev);
+
 	if (!netdev->phydev)
 		return;
 
 	phy_disconnect(netdev->phydev);
+	if (of_phy_is_fixed_link(priv->dev->of_node))
+		of_phy_deregister_fixed_link(priv->dev->of_node);
 }
 
 static void ftgmac100_destroy_mdio(struct net_device *netdev)
@@ -1867,6 +1871,26 @@ static int ftgmac100_probe(struct platform_device *pdev)
 			err = -EINVAL;
 			goto err_phy_connect;
 		}
+	} else if (np && of_phy_is_fixed_link(np)) {
+		struct phy_device *phy;
+
+		err = of_phy_register_fixed_link(np);
+		if (err) {
+			dev_err(&pdev->dev, "Failed to register fixed PHY\n");
+			goto err_phy_connect;
+		}
+
+		phy = of_phy_get_and_connect(priv->netdev, np,
+					     &ftgmac100_adjust_link);
+		if (!phy) {
+			dev_err(&pdev->dev, "Failed to connect to fixed PHY\n");
+			of_phy_deregister_fixed_link(np);
+			err = -EINVAL;
+			goto err_phy_connect;
+		}
+
+		/* Display what we found */
+		phy_attached_info(phy);
 	} else if (np && of_get_property(np, "phy-handle", NULL)) {
 		struct phy_device *phy;
 
-- 
2.37.3

