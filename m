Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 630445ADC12
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 01:57:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MM5661LMjz30M2
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 09:57:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=igHu4PgN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=igHu4PgN;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MM5601dHXz2xHC
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Sep 2022 09:56:55 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id 145so9758677pfw.4
        for <linux-aspeed@lists.ozlabs.org>; Mon, 05 Sep 2022 16:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=HxSa1nifl/BjX4IHSZwDFpkRT1uZIgkAl2NNuJKauFc=;
        b=igHu4PgNQHWwp544lo/os2ZQ09E310HyxSJoqP/7Oo8TMGEf6ZlVucL7lBaJpcT0Yd
         EpZZUZubSRzixOsaWplXxMB9pxcJeD5cf6KOqO8FREFIGdDLaPzlQDnj9Y4yDvunkv98
         62ZZ8WmcVC44VFm3ayQxZOj0dcMzU4a2ijXT20A/OreUOFgCLzkyQqGFQhJuw24RIdTF
         y5hrVuJ/byp5Uw1pf3Ouhqx2t6vE6DzliOdrlTeIpPKlMBVSiI/4lfQ6GuJvytBf/NIo
         YcrgvnJpT7j9Xmzo6eoE2Se9U6vqmbwzjBO10AEq/lwxcq5Tu2JscuYck6CG5wqEgm4h
         Q5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HxSa1nifl/BjX4IHSZwDFpkRT1uZIgkAl2NNuJKauFc=;
        b=zCU0rmnXD/1Bv+AQGtt9CiiQOqUAOUvrCS4gn30ekZbyPP7NpOnRFOdVnvytGMkz7b
         Hv9kQLcVdTREo8uN8CSIq47L9MZz2OhmXkTaXsKtUqqxv/6GoXICOiYZuznaeJcAVQLy
         QuAUZvHv6QGYqM1/noOykhjtOAqSX1Dryo4p7JcmAtOnrWLE4Myc73dPmZsQHDfhkPrW
         uAiO4K57ymqBoTTBWdfVLjRFduX6dDdiOpZl/TO9mrjhjLwKIPoKrr0iYYXwCUvymrTM
         75i1rWmEjbqZzLiHs7FDP4RNkHsi0ykqP6IAi+cqrd5BphLVYE31/NGCjAzQmoCho2s6
         SYFA==
X-Gm-Message-State: ACgBeo2+dr17l71QnzyC1SWJhH7RM4Z/WFh3bZnYaY4wi/5+qHQ/pkeG
	y3LC/e+LRZQ8PeHnAO2O0vE=
X-Google-Smtp-Source: AA6agR6AalO/X1wxUzxRBt1wOQhvPR3J3uYbqv142JppgLbGvt7zZWNTHzEuMhAdTbmTglc7fVcY4Q==
X-Received: by 2002:aa7:9e12:0:b0:53e:27d8:b71b with SMTP id y18-20020aa79e12000000b0053e27d8b71bmr238339pfq.46.1662422213841;
        Mon, 05 Sep 2022 16:56:53 -0700 (PDT)
Received: from localhost.localdomain ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id g26-20020aa79dda000000b00537f13d217bsm8405530pfq.76.2022.09.05.16.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 16:56:53 -0700 (PDT)
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
Subject: [PATCH net-next 1/2] net: ftgmac100: support fixed link
Date: Mon,  5 Sep 2022 16:56:33 -0700
Message-Id: <20220905235634.20957-2-rentao.bupt@gmail.com>
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

Support fixed link in ftgmac100 driver. Fixed link is used on several
Meta OpenBMC platforms, such as Elbert (AST2620) and Wedge400 (AST2520).

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
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
2.30.2

