Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C625AC91A
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Sep 2022 05:29:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLYsw1tgXz300V
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Sep 2022 13:29:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLYss0Yk5z2xZf
	for <linux-aspeed@lists.ozlabs.org>; Mon,  5 Sep 2022 13:29:35 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 28538mwx049169;
	Mon, 5 Sep 2022 11:08:48 +0800 (GMT-8)
	(envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 5 Sep
 2022 11:28:42 +0800
From: Neal Liu <neal_liu@aspeedtech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller"
	<davem@davemloft.net>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@aj.id.au>
Subject: [PATCH] crypto: aspeed: fix format unexpected build warning
Date: Mon, 5 Sep 2022 11:28:38 +0800
Message-ID: <20220905032838.1663510-1-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 28538mwx049169
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
Cc: BMC-SW@aspeedtech.com, kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This fixes the following similar build warning when
enabling compile test:

aspeed-hace-hash.c:188:9: warning: format '%x' expects argument of type
'unsigned int', but argument 7 has type 'size_t' {aka 'long unsigned int'}
[-Wformat=]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
---
 drivers/crypto/aspeed/aspeed-hace-hash.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/aspeed/aspeed-hace-hash.c b/drivers/crypto/aspeed/aspeed-hace-hash.c
index 0a44ffc0e13b..d0f61149fe24 100644
--- a/drivers/crypto/aspeed/aspeed-hace-hash.c
+++ b/drivers/crypto/aspeed/aspeed-hace-hash.c
@@ -186,7 +186,7 @@ static int aspeed_ahash_dma_prepare_sg(struct aspeed_hace_dev *hace_dev)
 	length = rctx->total + rctx->bufcnt - remain;
 
 	AHASH_DBG(hace_dev, "%s:0x%x, %s:0x%x, %s:0x%x, %s:0x%x\n",
-		  "rctx total", rctx->total, "bufcnt", rctx->bufcnt,
+		  "rctx total", rctx->total, "bufcnt", (u32)rctx->bufcnt,
 		  "length", length, "remain", remain);
 
 	sg_len = dma_map_sg(hace_dev->dev, rctx->src_sg, rctx->src_nents,
@@ -325,8 +325,8 @@ static int aspeed_hace_ahash_trigger(struct aspeed_hace_dev *hace_dev,
 	struct aspeed_sham_reqctx *rctx = ahash_request_ctx(req);
 
 	AHASH_DBG(hace_dev, "src_dma:0x%x, digest_dma:0x%x, length:0x%x\n",
-		  hash_engine->src_dma, hash_engine->digest_dma,
-		  hash_engine->src_length);
+		  (u32)hash_engine->src_dma, (u32)hash_engine->digest_dma,
+		  (u32)hash_engine->src_length);
 
 	rctx->cmd |= HASH_CMD_INT_ENABLE;
 	hash_engine->resume = resume;
-- 
2.25.1

