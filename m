Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 317AE97260E
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 02:09:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2kbM1wSXz2yRG
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 10:09:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725886841;
	cv=none; b=lXbghIq7YIIDsXn8sn+nTJU8K0RBILruiQcHqzFl2WbE10c58CvdeEqBFoO6USxiYrrHc6H6niuo618rS0tonSdncn2PQb2Hp63iI01MAwil+Ppto0oxaWoSH9SWRGXD9Y80da7JpcwI8XGJiUX2IV99B/9o4rWtyyySuiL9FAtof7OqdYeW52lIf6MFnelQfQ5ZE3jy0OrqHweluIhcZL2HFj2Cm009pd2fb2BUf1RPHnutps5MF9WdrUhl1DW6go+uwS0whzmOVbZHCKZlXrSY4bTd0tKF0Gbm3TdWvouPUq7lLB7wn1linoAo1OqfiUhjzFTcOJYAtI7aoamuJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725886841; c=relaxed/relaxed;
	bh=oDMcc+ePYu+Gd2Aw7L9v9GBfEArAdgLSr3atBFR4474=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4D6RLl1L3zdDz6a2XnJFjXqBL3IHXuLobHSPSMFQsOHPmNZ87303TCzdlpHuuwdHpxCiD+8+AfUTa3hwHlofkWZM7vyu5bU8gFBmpPb0Fgj9P97UL0iUw3gKKeJfgpOFx/ytO3e+V1XrG1MJ3RQYdS8Qvvy8bez3aG9dEU3jaXnpNmyE/uOSH3xYFGRrd7TArwg+p2HwdO6T+iMMucQ/oRI9ifqgYpc17KQ8YHv7PriAnZEeeQsuiErVGxm7nPDqG54C3QOMP5hDJxWkMJB9a9sR8+mQXr0uTHrTAki6DaqhHVyAVZKjz0AtvGl5xe2RLMJLJzQ5wHOShksa9wn5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2RlX6r3Tz2yNJ
	for <linux-aspeed@lists.ozlabs.org>; Mon,  9 Sep 2024 23:00:40 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X2RLl3lbjz2Dblt;
	Mon,  9 Sep 2024 20:42:39 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 622F21A0188;
	Mon,  9 Sep 2024 20:43:06 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Sep
 2024 20:43:05 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH 1/4] soc: qcom: rpmh-rsc: Simplify code with dev_err_probe()
Date: Mon, 9 Sep 2024 20:29:18 +0800
Message-ID: <20240909122921.12627-2-zhangzekun11@huawei.com>
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
 drivers/soc/qcom/rpmh-rsc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index de86009ecd91..cb82e887b51d 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -1045,12 +1045,9 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	 * do. To avoid adding this check to our children we'll do it now.
 	 */
 	ret = cmd_db_ready();
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Command DB not available (%d)\n",
-									ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Command DB not available\n");
 
 	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
 	if (!drv)
-- 
2.17.1

