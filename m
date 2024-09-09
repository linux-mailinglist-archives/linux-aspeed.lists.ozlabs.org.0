Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E1C972610
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 02:09:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2kbM3DRLz30Jc
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 10:09:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725886841;
	cv=none; b=h3/csO+5lYnouu15vW7QscjXKzQK96faihNFTTw8Fo3ft13m3MAMyeoo5rcJtEnQlai40JE9qtBJWSucGYWLHfOULCOfJuvhpWkhAmjRZaHUy7XBkoQ1hntek0cgbEsE05yeCSvSnT+9MHuCyfXMFSqJk+sxKb/EHKMFICD5eEZEUj3xqOo1YmwcmuMMkWOQo79LHw0/a3+85F5hncgMQYs7inqTzVmRFENoI9Fkc0dO31sJhIf1FRX4OfHnOaQkK23wjW0uTvR830q5UD3ouUL3+21ICMfXfG/4OkVxztJoXDzn1DBn8wFBRWrJETsJ6uf/fOKyr5h2aesRoaQMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725886841; c=relaxed/relaxed;
	bh=SpUo2Th0WXYOT+aBOneyLfCZAdMHThcWstQo2auGT74=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jk4uH0k5A+FLNgGRJepMQAokqdru2Xreh3uU/H1fVAIgDjlcoW/6o/NBh2N/wUP8Mawy559GcCmOHviuGKvMuGlKNTYhDZdKEHxJv2vsXD0Xs0CxkUXRNrjxVmLS76OKNuu73im3uIjsIbDvsOFtp/eVDyDLhbEnopZRg/slJ0MJGUmXOFyCEWy1cAqLhGRgOw+cYCNQTbnnCSneseR9AFJYwStBAInobCuMvszE/VAczcCQTuquE4iWoKMMqcC5IKv72rzjUuMtqhcawNHyGKI+PAUPDi95P0+H8WWOsWzYbvYxhUf5RF0u3tECJtidOhR823Zxsh4nB6SjQ98VTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2RlW4K0tz2yMF
	for <linux-aspeed@lists.ozlabs.org>; Mon,  9 Sep 2024 23:00:39 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X2RLk72kWz1j8Mc;
	Mon,  9 Sep 2024 20:42:38 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id A58501A016C;
	Mon,  9 Sep 2024 20:43:05 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Sep
 2024 20:43:04 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH 0/4] Simplify code with dev_err_probe()
Date: Mon, 9 Sep 2024 20:29:17 +0800
Message-ID: <20240909122921.12627-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
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

Use dev_err_probe() to simplify code, and we can avoid judging
if the error code is not equal to -EPROBE_DEFER

Zhang Zekun (4):
  soc: qcom: rpmh-rsc: Simplify code with dev_err_probe()
  soc: aspeed: Simplify code with dev_err_probe()
  soc: qcom: smem: Simplify code with dev_err_probe()
  soc: qcom: smp2p: Simplify code with dev_err_probe()

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 10 ++++------
 drivers/soc/qcom/rpmh-rsc.c           |  9 +++------
 drivers/soc/qcom/smem.c               |  8 +++-----
 drivers/soc/qcom/smp2p.c              |  9 +++------
 4 files changed, 13 insertions(+), 23 deletions(-)

-- 
2.17.1

