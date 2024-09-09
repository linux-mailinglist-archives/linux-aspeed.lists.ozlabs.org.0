Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B71D972612
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 02:09:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2kbM5sr1z3cBN
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 10:09:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725886971;
	cv=none; b=OFzJSKAbI9bJXH3ZU8FT/EQ/YamPhEXKvZGr6+3AhbuAAITuix7QRGgDSn0S8vR3MyXtm5VISvK4F8BALjeQDcFinHPzwDZwW96JRkIQm9h+FlP5M/4B12xbx+xDP7UDGGH2R12G1uMxVLObJzKHrcTbpJWlcSq4pNNnTBmkgATvTCM94mp5iXbniVgfoB/4PnHBwVJ5TEEC7Vs0bjhUA+BjPA1eD14O4wcS2pHX0A4qEmVSBr5cU7fHB23pSTdY+HPtcnlCJnVhUI1HkN5Q+ixbwrEPwx7cmIzEO+D1ElEnXWIxptAA8JOIba2KopyZQTzsZfQq6yhC1HyCzN5E5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725886971; c=relaxed/relaxed;
	bh=f++ofakngXpFniWSDLqyDWCVVC4987jRgS0MYHJFaDU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AzGDFGcW0+FaIYsFQ+u+5L61wZ0MUNXC78AmlAYq9B5p6kd/hB6C+z7b1QXpQ+iPcBT02ZSRhUiDLSwe9SobkyIn2lAhNDQAR4DTyzxvFEF8WIKvRUNDtcsGLgHmLOIOVG6f6zlfPtTtqPTULnSxQPGwAOU4bgZxs3ynkqJHf2uuLFefpMnwepgEpIV4RZSd8wUo5+m51Q/LQxqoBwB0J+oF74MxC2788uL056dKsmLQHgdnzmZeR5ECGgjcvoWtlTxMD42LzzicCWGTj9U88Ou89ZViNB9u8cOa/b9u7GOAGmOw6R/lOegYkS8P32obou09eMUKmtW/m+PoIrZ9/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2Rp208FZz2xSM
	for <linux-aspeed@lists.ozlabs.org>; Mon,  9 Sep 2024 23:02:49 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4X2RMF3bP2z1xx4Z;
	Mon,  9 Sep 2024 20:43:05 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F47414022D;
	Mon,  9 Sep 2024 20:43:07 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Sep
 2024 20:43:06 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH 2/4] soc: aspeed: Simplify code with dev_err_probe()
Date: Mon, 9 Sep 2024 20:29:19 +0800
Message-ID: <20240909122921.12627-3-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240909122921.12627-1-zhangzekun11@huawei.com>
References: <20240909122921.12627-1-zhangzekun11@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)
X-Mailman-Approved-At: Tue, 10 Sep 2024 10:09:33 +1000
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
Cc: zhangzekun11@huawei.com, chenjun102@huawei.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use dev_err_probe() directly in the driver probe phase, and we
don't need to judge if the error code is not equal to -EPROBE_DEFER.
This can simplify the code a bit.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 888b5840c015..33d9f8f2e662 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -293,12 +293,10 @@ static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
 	}
 
 	lpc_snoop->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(lpc_snoop->clk)) {
-		rc = PTR_ERR(lpc_snoop->clk);
-		if (rc != -EPROBE_DEFER)
-			dev_err(dev, "couldn't get clock\n");
-		return rc;
-	}
+	if (IS_ERR(lpc_snoop->clk))
+		return dev_err_probe(dev, PTR_ERR(lpc_snoop->clk),
+				     "couldn't get clock\n");
+
 	rc = clk_prepare_enable(lpc_snoop->clk);
 	if (rc) {
 		dev_err(dev, "couldn't enable clock\n");
-- 
2.17.1

