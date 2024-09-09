Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 832DD97260F
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 02:09:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2kbM0XD2z2yTs
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 10:09:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725886841;
	cv=none; b=Skoh0CP5VniU4eFAg0h10R5zl+UxW3zunGnf0gSRh0ZZAHDf/IBWJZKSlNa4ZCOQxXc6m3stO/HsJ/z9XoCX8x7vBuMI4rewsMdDQbPGZAqKni6WraxyuKh+MC9ecwaDShs853kzAE+dk4TDxsbBBc+qXbzgX5KYZcairFLwxMOkX7fABzvF8hMN88T64dnHR8qSQB7JsNE8hrj5YZIvj9h1xswIBixP3zqjdPsB7LNmizUOmeUB9qgQE5yFufwEK7PgHh2CER2MPD14Kh/u3bnMjuXHVgFtJybkFN6twIHR3WFEnkO1g8u0en+uQifS6iGL7ICtIkiaEBmcV10nbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725886841; c=relaxed/relaxed;
	bh=Wa0aEwWWk9Qj9iinrvyxksIE+dDFobuaByyZoyAqwwU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F/gWopIESFKi4GcqG8SnFYNbKfaBfNyj8zTV1RRM+eSnLZ4j2JSB6B7kFfdzNAnqfnNiD6tdCQUnVrKJjefWYU4ElXJJbnh5ltd65ICGR96cBgfJWfVEtyretSrLlRKPlrs0GartTaoZCmlCiP0xmg8V4VA/cc4dmJXxuK+M4cbH9O80h0YY7bck+x4nrllhgS3QOPn9AU2Tv1UUfes2CxJaiVtqVJpBoMwdeQXt3KukVpFBTpTNPAYGk4wzSQ4e+SaMzdx4/UI2iJYKRztecOf074XWyMHGyyeuSYXP2GAz/zzvUm00CHLlFHeSmQrWSZIRTaMzxUVw+1NRIIbmlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1043 seconds by postgrey-1.37 at boromir; Mon, 09 Sep 2024 23:00:39 AEST
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2RlW2VB9z2yM6
	for <linux-aspeed@lists.ozlabs.org>; Mon,  9 Sep 2024 23:00:38 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X2RLn6Hs0z1j8Ly;
	Mon,  9 Sep 2024 20:42:41 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 8B53A18002B;
	Mon,  9 Sep 2024 20:43:08 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Sep
 2024 20:43:07 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH 4/4] soc: qcom: smp2p: Simplify code with dev_err_probe()
Date: Mon, 9 Sep 2024 20:29:21 +0800
Message-ID: <20240909122921.12627-5-zhangzekun11@huawei.com>
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
 drivers/soc/qcom/smp2p.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index cefcbd61c628..2731449e2201 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -467,12 +467,9 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
 	int ret;
 
 	ret = qcom_smem_alloc(pid, smem_id, sizeof(*out));
-	if (ret < 0 && ret != -EEXIST) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(smp2p->dev,
-				"unable to allocate local smp2p item\n");
-		return ret;
-	}
+	if (ret < 0 && ret != -EEXIST)
+		return dev_err_probe(smp2p->dev, ret,
+				     "unable to allocate local smp2p item\n");
 
 	out = qcom_smem_get(pid, smem_id, NULL);
 	if (IS_ERR(out)) {
-- 
2.17.1

