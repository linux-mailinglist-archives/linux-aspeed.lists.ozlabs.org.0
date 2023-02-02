Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 833A9687624
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 08:05:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6qYH113qz3f3f
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Feb 2023 18:05:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6qY95Bldz3bM7
	for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Feb 2023 18:04:57 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 3126q2Ri020440;
	Thu, 2 Feb 2023 14:52:02 +0800 (GMT-8)
	(envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Feb
 2023 15:03:48 +0800
From: Neal Liu <neal_liu@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Neal Liu
	<neal_liu@aspeedtech.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S
 . Miller" <davem@davemloft.net>
Subject: [PATCH v2 -next] crypto: aspeed: fix type warnings
Date: Thu, 2 Feb 2023 15:03:45 +0800
Message-ID: <20230202070345.191514-1-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 3126q2Ri020440
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
Cc: linux-crypto@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This patch fixes following warnings:

1. sparse: incorrect type in assignment (different base types)
Fix: change to __le32 type.
2. sparse: cast removes address space '__iomem' of expression
Fix: use readb to avoid dereferencing the memory.

Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
---
Change since v1: keep iomem marker to remain its purpose.

 drivers/crypto/aspeed/aspeed-acry.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/aspeed/aspeed-acry.c b/drivers/crypto/aspeed/aspeed-acry.c
index 164c524015f0..f2429e699d14 100644
--- a/drivers/crypto/aspeed/aspeed-acry.c
+++ b/drivers/crypto/aspeed/aspeed-acry.c
@@ -252,7 +252,7 @@ static int aspeed_acry_rsa_ctx_copy(struct aspeed_acry_dev *acry_dev, void *buf,
 				    enum aspeed_rsa_key_mode mode)
 {
 	const u8 *src = xbuf;
-	u32 *dw_buf = (u32 *)buf;
+	__le32 *dw_buf = (__le32 *)buf;
 	int nbits, ndw;
 	int i, j, idx;
 	u32 data = 0;
@@ -302,7 +302,7 @@ static int aspeed_acry_rsa_ctx_copy(struct aspeed_acry_dev *acry_dev, void *buf,
 static int aspeed_acry_rsa_transfer(struct aspeed_acry_dev *acry_dev)
 {
 	struct akcipher_request *req = acry_dev->req;
-	u8 *sram_buffer = (u8 *)acry_dev->acry_sram;
+	u8 __iomem *sram_buffer = (u8 __iomem *)acry_dev->acry_sram;
 	struct scatterlist *out_sg = req->dst;
 	static u8 dram_buffer[ASPEED_ACRY_SRAM_MAX_LEN];
 	int leading_zero = 1;
@@ -321,11 +321,11 @@ static int aspeed_acry_rsa_transfer(struct aspeed_acry_dev *acry_dev)
 
 	for (j = ASPEED_ACRY_SRAM_MAX_LEN - 1; j >= 0; j--) {
 		data_idx = acry_dev->data_byte_mapping[j];
-		if (sram_buffer[data_idx] == 0 && leading_zero) {
+		if (readb(sram_buffer + data_idx) == 0 && leading_zero) {
 			result_nbytes--;
 		} else {
 			leading_zero = 0;
-			dram_buffer[i] = sram_buffer[data_idx];
+			dram_buffer[i] = readb(sram_buffer + data_idx);
 			i++;
 		}
 	}
-- 
2.25.1

