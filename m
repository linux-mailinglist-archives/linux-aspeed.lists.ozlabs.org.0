Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FF7529DE0
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 May 2022 11:22:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2VyR0pLPz3bwH
	for <lists+linux-aspeed@lfdr.de>; Tue, 17 May 2022 19:22:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jjmyQQop;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jjmyQQop; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2VyL4pRBz3bhK
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 May 2022 19:22:34 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id i1so16810961plg.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 17 May 2022 02:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UQ4351L2HP//X/dnhx6DfmVwSjUQ2XvoIaRBFsv4r48=;
 b=jjmyQQopKP9lxVSgB5jDFBCm2lbrlH+y3b27rxayr/FHdo48UbYhhJpOCJu6Uduo92
 qMGSGMriHZyFgy0F8tOw3/JrNHTh3beU6CCmZp8ENYpj8g+fQTUjxGtkHV6C45XPzF/M
 phiZkapYWHvoKhi1T4lA19x9wslMtWk6e2ulGy2aqe9vTzx2GqLvVqCf4R+R2d8qC60F
 P1s9j2J1SDcppY1CVLyFDJyD3PCKD6UY4uIqYrMAxA6pfaBb2kMG9LkRyH91uBoTg1hX
 VGO5Gjxg+57q+msYJwdvre+J2Ik8/UQY07e8M0d2FXVb/W6R6AmwTubMY9C4tWwsR3F6
 gtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=UQ4351L2HP//X/dnhx6DfmVwSjUQ2XvoIaRBFsv4r48=;
 b=tpaRAj61jbUvC9UYI/kjONuvWdMV7nOFKcT9HpKUN0yLie4H3XKQ/8uW9qATbLUO0n
 JNpSxgSK0II3bdXl1BGiK1JVnRNj5Fw+Zay6AG2i0T3ky84wu9+VCTHseF+oWgPihSdy
 9PxanPY6Ygex5eiU332xs5/1Xzd2kL4by+bRxsshrk3p/9i2lrqC5bG6GRgDUNWGtN9p
 /FWlQc7UJhpSDWBhFmcF6Tu8jMcKs6AUxDQCmNBu0K9PllLXGaTLUM1bd9kL/xuTlJwN
 nqGDUXCqKlScYPYc/u5BSKvUen2Iyr/chVDEhZ1C8ziz13KnF6fAgVvhEyVF72zNf8rY
 /vHw==
X-Gm-Message-State: AOAM530Rq9ovZ+w87QndaEY4SKeFl1c3RilFgtg+cYKaV1N8irTBGDcm
 Ud8xU9DYRaiI+DlVQ0kOzXQ=
X-Google-Smtp-Source: ABdhPJwcxmgYmbg3wS9+Q4qoyAqYE3D9gBE1s/TGq/piaGQbe7hiCkSLMCsOAK1T/26S1IuDLQ+Qtg==
X-Received: by 2002:a17:903:124a:b0:154:c7a4:9374 with SMTP id
 u10-20020a170903124a00b00154c7a49374mr21443077plh.68.1652779351458; 
 Tue, 17 May 2022 02:22:31 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7915a000000b00512ee2f2363sm6964176pfi.99.2022.05.17.02.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:22:30 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH net v3] net: ftgmac100: Disable hardware checksum on AST2600
Date: Tue, 17 May 2022 18:52:17 +0930
Message-Id: <20220517092217.323060-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: netdev@vger.kernel.org, David Wilder <wilder@us.ibm.com>,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2600 when using the i210 NIC over NC-SI has been observed to
produce incorrect checksum results with specific MTU values. This was
first observed when sending data across a long distance set of networks.

On a local network, the following test was performed using a 1MB file of
random data.

On the receiver run this script:

 #!/bin/bash
 while [ 1 ]; do
        # Zero the stats
        nstat -r  > /dev/null
        nc -l 9899 > test-file
        # Check for checksum errors
        TcpInCsumErrors=$(nstat | grep TcpInCsumErrors)
        if [ -z "$TcpInCsumErrors" ]; then
                echo No TcpInCsumErrors
        else
                echo TcpInCsumErrors = $TcpInCsumErrors
        fi
 done

On an AST2600 system:

 # nc <IP of  receiver host> 9899 < test-file

The test was repeated with various MTU values:

 # ip link set mtu 1410 dev eth0

The observed results:

 1500 - good
 1434 - bad
 1400 - good
 1410 - bad
 1420 - good

The test was repeated after disabling tx checksumming:

 # ethtool -K eth0 tx-checksumming off

And all MTU values tested resulted in transfers without error.

An issue with the driver cannot be ruled out, however there has been no
bug discovered so far.

David has done the work to take the original bug report of slow data
transfer between long distance connections and triaged it down to this
test case.

The vendor suspects this this is a hardware issue when using NC-SI. The
fixes line refers to the patch that introduced AST2600 support.

Reported-by: David Wilder <wilder@us.ibm.com>
Reviewed-by: Dylan Hung <dylan_hung@aspeedtech.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3 modifies the wrapping of the commit message.

v2 updates the commit message with confirmation from the vendor that
this is a hardware issue, and clarifies why the commit used in the fixes

 drivers/net/ethernet/faraday/ftgmac100.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index caf48023f8ea..5231818943c6 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1928,6 +1928,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	/* AST2400  doesn't have working HW checksum generation */
 	if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac")))
 		netdev->hw_features &= ~NETIF_F_HW_CSUM;
+
+	/* AST2600 tx checksum with NCSI is broken */
+	if (priv->use_ncsi && of_device_is_compatible(np, "aspeed,ast2600-mac"))
+		netdev->hw_features &= ~NETIF_F_HW_CSUM;
+
 	if (np && of_get_property(np, "no-hw-checksum", NULL))
 		netdev->hw_features &= ~(NETIF_F_HW_CSUM | NETIF_F_RXCSUM);
 	netdev->features |= netdev->hw_features;
-- 
2.35.1

