Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 259A3972611
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 02:09:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2kbM4Wrmz3c7K
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 10:09:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725886846;
	cv=none; b=U8oNHyh6QlcMafwnzZ8M9KbOMas0yID1rb9qc3tYoKabh0xetRq05S28DOTHBs2ssKttti2iYthXNAfwlXtijYTFtPua4NgoICP3d4saYMEgNL0cPRc4vsajjXZJYGTWg7h/VByDVzqrY3Oczl7gGAWHzwZqOS1K/a15JvxznIdXF8T4tn2X81g324KflQJEARo4Yjcfb5Z7zJ1HxKeOa7CTlb8M8zGc2yWOmWhn2vvSVWr5xa6tfB5jlDSglLaWZEuThEp8xxCrajUlCF0eKsw86h41xcDiF4pSx3XeKKkBFTRD/T/l7IkvL9bXSr7jHmbhJ6y/EZ/jlIDejtgvcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725886846; c=relaxed/relaxed;
	bh=EI1KIm8J51o4494mkqJuAbX943qVpQs52XbPFb+FTDc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qp1jlg63SvlkfD8fIgEJT7UC/HHonVxhyyZnF3LYZUGDX0qPC5IG5Aefwscvk7qRIrvG3kG2aO8jZD2UchJJ3JWSKs9Crg7Nlkr6SWdlCBIkLI9dBbYtDyS7OyQwHxeVZTUe0DjL3TGfW8yKQBqtkTFi/SHDUcI3NyTVGwGvvTfLMNwAjDxprtCzGLFNQ74foBWREEpFBrEasqjQsby1zONKX4et8RiYDjlOKlXh5Re28HXtgvAUFZc/ibACJ/IncW8G+28qG+ruJ9CwHZ/V08aYKo0FvWB67Fm89glDPduECZa61awVHQowz5V49xSjjPvYN5JWZkMcwGfEzUF5ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2Rlc6GTSz2yPD
	for <linux-aspeed@lists.ozlabs.org>; Mon,  9 Sep 2024 23:00:44 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X2RLn14bNz1j7Y4;
	Mon,  9 Sep 2024 20:42:41 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id CD52E140134;
	Mon,  9 Sep 2024 20:43:07 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Sep
 2024 20:43:06 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH 3/4] soc: qcom: smem: Simplify code with dev_err_probe()
Date: Mon, 9 Sep 2024 20:29:20 +0800
Message-ID: <20240909122921.12627-4-zhangzekun11@huawei.com>
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
 drivers/soc/qcom/smem.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index e4411771f482..a8ab99c9c996 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -1180,11 +1180,9 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	}
 
 	hwlock_id = of_hwspin_lock_get_id(pdev->dev.of_node, 0);
-	if (hwlock_id < 0) {
-		if (hwlock_id != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to retrieve hwlock\n");
-		return hwlock_id;
-	}
+	if (hwlock_id < 0)
+		return dev_err_probe(&pdev->dev, hwlock_id,
+				     "failed to retrieve hwlock\n");
 
 	smem->hwlock = hwspin_lock_request_specific(hwlock_id);
 	if (!smem->hwlock)
-- 
2.17.1

