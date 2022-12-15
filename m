Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CCF64D739
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Dec 2022 08:22:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXkFc6Xhjz3bZ8
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Dec 2022 18:22:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.23; helo=cstnet.cn; envelope-from=jiasheng@iscas.ac.cn; receiver=<UNKNOWN>)
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NX0Mj69rZz2xJF
	for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Dec 2022 13:54:55 +1100 (AEDT)
Received: from localhost.localdomain (unknown [124.16.138.125])
	by APP-03 (Coremail) with SMTP id rQCowAAHD5fXOpljjICpBg--.26176S2;
	Wed, 14 Dec 2022 10:54:15 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2] usb: gadget: aspeed_udc: Add check for dma_alloc_coherent
Date: Wed, 14 Dec 2022 10:54:14 +0800
Message-Id: <20221214025414.44866-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAHD5fXOpljjICpBg--.26176S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWfGw4fZF4Uur1rZry8Grg_yoWkCrbE9F
	4UWF15Wryava9Fgr1jvw13Aryq9a48u34kW3WvkF13Aa43Ga4xXr1jqr95ur47ZFy7uFn8
	Aas0krW7X3y7XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x0JUHWlkUUUUU=
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Mailman-Approved-At: Thu, 15 Dec 2022 18:09:25 +1100
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
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>, linux-aspeed@lists.ozlabs.org, neal_liu@aspeedtech.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org, christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add the check for the return value of dma_alloc_coherent in order to
avoid NULL pointer dereference.

This flaw was found using an experimental static analysis tool we are
developing, APP-Miner, which has not been disclosed.

The allyesconfig build using GCC 9.3.0 shows no new warning. As we
don't have a UDC device to test with, no runtime testing was able to
be performed.

Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
Changelog:

v1 -> v2:

1. Add "goto err;" when allocation fails.
---
 drivers/usb/gadget/udc/aspeed_udc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 01968e2167f9..7dc2457c7460 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -1516,6 +1516,10 @@ static int ast_udc_probe(struct platform_device *pdev)
 					  AST_UDC_EP_DMA_SIZE *
 					  AST_UDC_NUM_ENDPOINTS,
 					  &udc->ep0_buf_dma, GFP_KERNEL);
+	if (!udc->ep0_buf) {
+		rc = -ENOMEM;
+		goto err;
+	}
 
 	udc->gadget.speed = USB_SPEED_UNKNOWN;
 	udc->gadget.max_speed = USB_SPEED_HIGH;
-- 
2.25.1

