Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A255370AD
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 13:10:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9wnS44h2z3bl8
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 May 2022 21:10:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UD/IIWn1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UD/IIWn1;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9wnL3ghkz2ypf
	for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 21:10:28 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id gh17so16101625ejc.6
        for <linux-aspeed@lists.ozlabs.org>; Sun, 29 May 2022 04:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Iy/F7uqP/QJ+JhJfiMPaLwgsjVlSR1sJFsXemWM3y5M=;
        b=UD/IIWn1gRH+c3m2RcFFnI/6dzrWKsaPfaKlE/5FHsXq+P6MmJf9bjE6eR0BGNdQGV
         isYY9q4ss901WSypLH0hEZQLxNVVK//qZ2VPw/JkwgPm2DnCTjlniBj8FrS37QJJ8xVz
         lkCY9mz9loP0fSJxFYoHVBIXTobXxk7el8bfQ0gWnFstc+g+FBXcOn9qT259CYURBMLQ
         9eSkks2nCNBbAll+7pyuWPgy5tgZh9745/mrKz4swOGQ0JBdRUY0VdF/iQnnBvr/b+J3
         UzP5zVo8783Ktqsx0MGXb79w1ulcJekQuSxG5afNW7fP6AU0wThoBIOnf8nabOJUebR5
         tS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Iy/F7uqP/QJ+JhJfiMPaLwgsjVlSR1sJFsXemWM3y5M=;
        b=UZ6a+nfsWxNqkM1JcV0eGd/KzF8zZft1vswT6gY7YtiARSmXM0/XOR2Y5p5OTNCmFt
         SHhEcdS9L6STrXNTED1Whim8IAqCpbXyWMT8nj9VlmXxgsDrCB/GbcaPR5mKTUfuVmmh
         OZ/Q3b5ATerDUNPWtn3f+JRwgiUjDTZo5fVjzSwHv0GfZzRDM4VYAWSa+/NFtTt8P9H4
         6m8Dat5eDSv7cC6Z24Ewp8PjWi+J27Kr9j+IOJZY1Vr731jucisWjYfY4UtSlJZIfT/2
         c7zByONuAXaYDt8oHDSJbyzgCC9e3Knb3d39sKYw9W5gSVPjJ6ZJYZFTpZDO67CQHa1b
         NY5g==
X-Gm-Message-State: AOAM531k+VaqNJPX7D6/LNjgUV4KToDi86xKzptMsqVMsv6bbJV6M51J
	muC6dHBjNNFzV6Itrx/uhfkmaw==
X-Google-Smtp-Source: ABdhPJyJ1wAI1x+8OgmzP9eOjOPL/AP7OqXQtjePyQU8l4VkCQrTwGs/pAVpjCfcxOmFsJgEdcL+Lw==
X-Received: by 2002:a17:907:6294:b0:6e1:ea4:74a3 with SMTP id nd20-20020a170907629400b006e10ea474a3mr44381372ejc.168.1653822624272;
        Sun, 29 May 2022 04:10:24 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d3-20020a1709063ec300b006fee2bdf6c6sm3073996ejj.169.2022.05.29.04.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 04:10:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 1/2] net/ncsi: use proper "mellanox" DT vendor prefix
Date: Sun, 29 May 2022 13:10:16 +0200
Message-Id: <20220529111017.181766-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

"mlx" Devicetree vendor prefix is not documented and instead "mellanox"
should be used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 net/ncsi/ncsi-manage.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 78814417d753..80713febfac6 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -1803,7 +1803,8 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 	pdev = to_platform_device(dev->dev.parent);
 	if (pdev) {
 		np = pdev->dev.of_node;
-		if (np && of_get_property(np, "mlx,multi-host", NULL))
+		if (np && (of_get_property(np, "mellanox,multi-host", NULL) ||
+			   of_get_property(np, "mlx,multi-host", NULL)))
 			ndp->mlx_multi_host = true;
 	}
 
-- 
2.34.1

