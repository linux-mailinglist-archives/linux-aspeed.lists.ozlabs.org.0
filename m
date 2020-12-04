Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEE92CEA54
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Dec 2020 09:58:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnRSz1JwBzDrHs
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Dec 2020 19:58:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.helo=cstnet.cn
 (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=vulab@iscas.ac.cn;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iscas.ac.cn
X-Greylist: delayed 384 seconds by postgrey-1.36 at bilbo;
 Fri, 04 Dec 2020 19:58:36 AEDT
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CnRSr1YrNzDr8V
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Dec 2020 19:58:35 +1100 (AEDT)
Received: from localhost.localdomain (unknown [124.16.141.242])
 by APP-01 (Coremail) with SMTP id qwCowACXn0+q+MlfGBnaAA--.27966S2;
 Fri, 04 Dec 2020 16:51:55 +0800 (CST)
From: Xu Wang <vulab@iscas.ac.cn>
To: balbi@kernel.org, gregkh@linuxfoundation.org, joel@jms.id.au,
 andrew@aj.id.au, rentao.bupt@gmail.com, benh@kernel.crashing.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH] usb: gadget: aspeed: Remove redundant null check before
 clk_disable_unprepare
Date: Fri,  4 Dec 2020 08:51:50 +0000
Message-Id: <20201204085150.3063-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowACXn0+q+MlfGBnaAA--.27966S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy8CFy8AFWxXryxJFy7KFg_yoWfGrgEkr
 1UWF4xW3WYvwsIyw1UGay5C34qga4kuw409F1ktFn5ZFWjgw43XryjvrZ5CF17Za17C3Z5
 Awn8Gr43Zw4fujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb2xYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GFyl42xK82IY
 c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
 vE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
 87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUx6wCDUUUU
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQoAA102ZxEfFgAAsU
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Because clk_disable_unprepare() already checked NULL clock parameter,
so the additional check is unnecessary, just remove it.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/usb/gadget/udc/aspeed-vhub/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index be7bb64e3594..ea47f4b98de9 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -282,8 +282,7 @@ static int ast_vhub_remove(struct platform_device *pdev)
 	       VHUB_CTRL_PHY_RESET_DIS,
 	       vhub->regs + AST_VHUB_CTRL);
 
-	if (vhub->clk)
-		clk_disable_unprepare(vhub->clk);
+	clk_disable_unprepare(vhub->clk);
 
 	spin_unlock_irqrestore(&vhub->lock, flags);
 
-- 
2.17.1

