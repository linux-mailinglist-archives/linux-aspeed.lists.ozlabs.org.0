Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBA0650EB
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 06:20:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kjXB6T71zDqhm
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2019 14:20:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pdfcgHou"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dGw4pyKA"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kjX351v4zDqhm
 for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2019 14:20:19 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 276A72F08;
 Thu, 11 Jul 2019 00:20:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Jul 2019 00:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=HZcia/IfVzkvd
 lkvnb5LKV31CBZHUGSpuuBvYoxo1kk=; b=pdfcgHouKdKuYmfxpsOaP6K77uack
 pqSsatKYFQ0izSJYE04AQd0ZQ9T3WwACruy74H758hT+Y34YjTeY1rlxDpvPkfoX
 WF7pFEd90LA52Bel8RXQ2Rx+G2se15f+Ba4s6XRXR5HiVUiLBCg6Juu0glKats0Q
 8pbo9O8F2yPIuuWi8YfXcSpvCBAhrqOek+t3v6HsLNXuFQQ4ryHItcbted+KjpbK
 ANLZ9dqUQFwvsDoc/+y6VLNmBLj4+UGghVfLWnFt8be3BTiouv2YYJkKknsOJLd4
 RSUtY9Cizor8dZQvDh+244oXIU2RIkqNvUyyMtZpAHLZkqYeuhNQavn+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=HZcia/IfVzkvdlkvnb5LKV31CBZHUGSpuuBvYoxo1kk=; b=dGw4pyKA
 2n/im6cU11TCGqY7ZrXDTVMb23naYGovlb5tij+18E7pMSayDOueYwdIbIjZTxMS
 m2Qqvq2QoAOrmIqwBMLxHjpEJJfMjm7EjfZzDr35pcME4SbQltnL4NxcdClFfiXf
 BZkO2I6GLcTt57n9qbrx1Q5IBMS42dONscdBBrb1+Bp3cxvCfXvjJk/JdKD9M27J
 pEl15KBq3pQOoQ780kEzUfb0mtOvXFU/rkHFpUfZ7U2Apj/TKli/Z25xDr0pmdyj
 sOFtNrFkRofrYV8d5c4RbimT+WdUBrVdF4O66klVjpgRoqQzx/Ajx0D1vGo6i6B4
 EJjwiJJavaVB1A==
X-ME-Sender: <xms:ALkmXXV0bcNWplwFBt949UjpF7Zssd-U5nNs3MnD6KA6Jj76bvGW1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeejgdektdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 fe
X-ME-Proxy: <xmx:ALkmXSKUy5CCssGBvIjkAddVPKvTwkwJF2oS3pmtT4pUKz6Ia4FA7Q>
 <xmx:ALkmXXBzOiBiXQN1CrMKRvOw7tCMa-nc5zJ8cQg08V0zj_w3hpDDgQ>
 <xmx:ALkmXSd8ZtXUKKVT0PP36KAl8hHBNVrPEeFPJgOLhMhB38oFcl4W-w>
 <xmx:AbkmXbu3zc4oHjPB991BmzWgCKDe0tMeskvLDUDpLaHMmD-TIP3fAQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2B1C780059;
 Thu, 11 Jul 2019 00:20:12 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH 5/6] pinctrl: aspeed: Add SIG_DESC_CLEAR() helper
Date: Thu, 11 Jul 2019 13:49:41 +0930
Message-Id: <20190711041942.23202-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190711041942.23202-1-andrew@aj.id.au>
References: <20190711041942.23202-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 linus.walleij@linaro.org, ryanchen.aspeed@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The complement of SIG_DESC_SET().

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinmux-aspeed.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index 474820df6263..c59e936a7dde 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -508,6 +508,7 @@ struct aspeed_pin_desc {
  * @idx: The bit index in the register
  */
 #define SIG_DESC_SET(reg, idx) SIG_DESC_IP_BIT(ASPEED_IP_SCU, reg, idx, 1)
+#define SIG_DESC_CLEAR(reg, idx) SIG_DESC_IP_BIT(ASPEED_IP_SCU, reg, idx, 0)
 
 #define SIG_DESC_LIST_SYM(sig, group) sig_descs_ ## sig ## _ ## group
 #define SIG_DESC_LIST_DECL(sig, group, ...) \
-- 
2.20.1

