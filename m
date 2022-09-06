Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7A55ADFA9
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 08:20:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMFcr1R6yz3bZP
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 16:20:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KyXRFDau;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KyXRFDau;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMFcl36r7z2xKV
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Sep 2022 16:20:39 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id q3so10229390pjg.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 05 Sep 2022 23:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=nGBVFgXS0eqoiY86MSD6T7/S6VN4vNYiYOjgs/oE4mY=;
        b=KyXRFDauk1axtxubltzu8BL+9pcdtxnAvJKf+Xw9R/aDIRKMEHXxUXHNyFcdP60sIO
         +3AtxKFVqBcoQH27ignZ39T5f7Y9tT3ze/AAQ/thdm0vLFaNBnNxQEaX78lCtjCGwwaz
         4BmDjwFL8PNJn8vW/YpYg0s+kmvpEiLMslNQgk5G8amP8+R7qzmXF/WBkx0xpIlrWJ/c
         xID8JpzAwaYSUgFc+RYodWx8A4EBque0dhLl/U1vmCKz0OIVNWArVOW2u7PYwana5ntt
         Pc0h2VD1ncsV7y+n273AlV0CieRr8fyqOCTynk9uzk+TquvyQDwMDLb6reEGou32+UxD
         hX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nGBVFgXS0eqoiY86MSD6T7/S6VN4vNYiYOjgs/oE4mY=;
        b=kyANPC2Q3kUPrImbNISZodzkdFNe3OovEzEmyrOOrplSTBiSf8FimdWQjghqaml0Wz
         YTLpeQecTUH2Mruqy8xaOPag4ySBzQ85rYxjdr0DF7fSFvTFUUDOF1Xx8869i/lx/7co
         l/wvcqok9m/VwswbQdI4zzMD3tEKfyCV6y0SlZ9KsUhkbSyPeSTr6eEQvBw7zMitMPmv
         N7ZYjLS4QkJ2JtKunIREl+nX7yTcRWDFxuHHUSfIf9iGEu9PVoB+SgraE5jHnK0mvhrj
         6jB5rhb7GquiDgkXexZQDPYV4da9LYmyM6vPZXXatRHjTVWxQAnG6pSF1PAj2IXUSihX
         GbQw==
X-Gm-Message-State: ACgBeo3K+dpP5Kj/ml+SSp25u4v2icOwFYT3kLoS0MV5Y2HtDuaCHGv+
	6HtiPKGCNBx5/CwEB32iUx4=
X-Google-Smtp-Source: AA6agR53PUca4ir2leHPUVovDvemsSXgnFsYiOcmz3zQdzyDkaeSkXfx+UaVJ9p02CUgb1p2FUTNjA==
X-Received: by 2002:a17:902:7845:b0:16e:d647:a66c with SMTP id e5-20020a170902784500b0016ed647a66cmr50876749pln.64.1662445236481;
        Mon, 05 Sep 2022 23:20:36 -0700 (PDT)
Received: from localhost.localdomain ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id m16-20020a170902db1000b00172dd10f64fsm8877798plx.263.2022.09.05.23.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 23:20:35 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/2] net: ftgmac100: support fixed link
Date: Mon,  5 Sep 2022 23:20:25 -0700
Message-Id: <20220906062026.57169-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220906062026.57169-1-rentao.bupt@gmail.com>
References: <20220906062026.57169-1-rentao.bupt@gmail.com>
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

