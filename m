Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F2095FE14
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2024 02:49:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt88F6CR6z30XR
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2024 10:49:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.255
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724678120;
	cv=none; b=U0tM+bTu6i1FKCxFAq0dMVuK6NqnuDjN+wpszcz20MsLi8GzyLI91B0fgwfpEBHOhuEM+TFyVOmeosmZP9SLejgl2/txCmyMgOF0sr+wUrzsCafDC8ifjZ5eOi1WRYY+yJNuUy4u3e4zlk7TVzigH+3R7jFw4ObxKOvhvA7zsAb6cVRg8QPZXZwU53TQbcRnEtQP2Z+7DlnjYO7jyrNbyeIVXzfvZx1vm9+rIbUCzeaLx00Ln0xqrRdCoxAmpr6c73MqsvjKSZ2XQ2Q789jPtxqf3sKETTRSMLj15ixIuYGFIS8b3TqCD7xWEPgSD6W3kZZ/kxlTV7GF3qjY0xhCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724678120; c=relaxed/relaxed;
	bh=Ihg09e/tJZgw5gOu2as+RrKzNtENaPWCgz54qdp5M2E=;
	h=X-Greylist:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy; b=KJfKfHWv+mcJdJgi3nWIdbB+in8cpdMYR7uLxZ007gM04rN3Ai6rqW7hUT7vqtNXVkWo2Jplx/g7tEbTJ55kfsdKMqtcvQ0S20SMaqMTM+fNlWSz2HwyBRsx4ExwEx6zO6zvbWMLyTpUfGMfhTihRjAW9WKPXYqlC0fWZm3qFtm9fZX3cusclPv9fZkgNcAAOBSOBwaEmN/NOViZWbXQ13FmYYW0ohHCLLDJxcLjomYX9LNdGaFa5Kw22GYnlJqtAgsPpg/YDTN17wOZJZJyS+L0t6aEq/lG8eegggdlDuqh6769pctk8gIWqxqhO9irz5xGHMXV8r7o2FjY1zh/Hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=liaochen4@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=liaochen4@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1084 seconds by postgrey-1.37 at boromir; Mon, 26 Aug 2024 23:15:20 AEST
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsrkw0yj1z2y8t;
	Mon, 26 Aug 2024 23:15:15 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WsrJx2GScz146qY;
	Mon, 26 Aug 2024 20:56:17 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id F069818006C;
	Mon, 26 Aug 2024 20:57:02 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 26 Aug
 2024 20:57:02 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH -next] mmc: sdhci-of-aspeed: fix module autoloading
Date: Mon, 26 Aug 2024 12:48:51 +0000
Message-ID: <20240826124851.379759-1-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.77]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500020.china.huawei.com (7.185.36.49)
X-Mailman-Approved-At: Tue, 27 Aug 2024 10:49:46 +1000
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
Cc: ulf.hansson@linaro.org, adrian.hunter@intel.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 430c1f90037b..37240895ffaa 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -510,6 +510,7 @@ static const struct of_device_id aspeed_sdhci_of_match[] = {
 	{ .compatible = "aspeed,ast2600-sdhci", .data = &ast2600_sdhci_pdata, },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, aspeed_sdhci_of_match);
 
 static struct platform_driver aspeed_sdhci_driver = {
 	.driver		= {
-- 
2.34.1

