Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A35EF96F472
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 14:42:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0bTT07Tkz3c5m
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 22:42:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725369821;
	cv=none; b=i1rj82TiPi69l4C0FZDcwTT4vypcjFPx/8jZckgS+Rre8CPE0/IrFxlkBVuid+wiZyVIJ5V4VZqZZXh9nRFYp3xCLhFEAp7O70MSD967K9xoyV04Cerd1pFvzf633RA/KgWpXYrkmvNIIZX/gJSqdEfwo5Ydyl4eYSrjDl51dPvxVSmtuNeN83QlgaNKi+g/HEDdmftliwPJkhFqHU7dNWvqDP/Le2VIQSDKGZA+6BTtlvkC+rvMV4QwBiRspuJX2bCjJWZfyWSJGg7cnLWWzXr4icAFMxAVvaRfDZ9vT3Ucj5jKm5T41/yWwbFUz5zcs2oag/JAvrfESlaNneDG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725369821; c=relaxed/relaxed;
	bh=tl0BsqDbwqpcFg8ILUuMpB9PSc/2eG76oOIUcZmIU9I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RygTeEM1EKkP4MA2mM5YigHxsDgGvCrJuBvolxxdzwvcDfri4h1UQuLcOo+kVUluV/jQk2pVn0jzHRBIjXU1kIgPuWO6B+epF4Xk0NqMUZ3Nz/A5KJo3z7pCZsjDlaMq1d/8hCg1u1vArl2LjVSbLkKuxg6Na5waaLit4kDXXK5ST07w7wtJvkcB9meTihVzkR8sxbJVfTbEHjtthyRtNk79VyX/7YzTutqgxEnDPKlaVOky4NG45M/CPixaCs0qVFVn5obnBsufTRIY1GqNgu1Nw1yKSd7oS9SqmzHWC/q/zVvBQJdZy1nze7iv99YiS11tJfeE1ooyho20vW/vuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=liaochen4@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=liaochen4@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WymXq6V3yz2yJL
	for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Sep 2024 23:23:34 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WymXF2nfYz2CcBb;
	Tue,  3 Sep 2024 21:23:09 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 9263B180019;
	Tue,  3 Sep 2024 21:23:28 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 3 Sep
 2024 21:23:28 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH -next] serial: 8250_aspeed_vuart: Enable module autoloading
Date: Tue, 3 Sep 2024 13:15:03 +0000
Message-ID: <20240903131503.961178-1-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.77]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500020.china.huawei.com (7.185.36.49)
X-Mailman-Approved-At: Fri, 06 Sep 2024 22:42:03 +1000
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
Cc: andriy.shevchenko@linux.intel.com, florian.fainelli@broadcom.com, gregkh@linuxfoundation.org, liaochen4@huawei.com, andi.shyti@linux.intel.com, u.kleine-koenig@pengutronix.de, tglx@linutronix.de, jirislaby@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 53d8eee9b1c8..25c201cfb91e 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -561,6 +561,7 @@ static const struct of_device_id aspeed_vuart_table[] = {
 	{ .compatible = "aspeed,ast2500-vuart" },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, aspeed_vuart_table);
 
 static struct platform_driver aspeed_vuart_driver = {
 	.driver = {
-- 
2.34.1

