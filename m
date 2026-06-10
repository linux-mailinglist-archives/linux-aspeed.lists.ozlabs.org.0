Return-Path: <linux-aspeed+bounces-4221-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4JzrKUTvKWpPfwMAu9opvQ
	(envelope-from <linux-aspeed+bounces-4221-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jun 2026 01:12:04 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EF966D51C
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jun 2026 01:12:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FTdEpimB;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4221-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4221-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gbM3y33Rkz2ykX;
	Thu, 11 Jun 2026 09:11:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781112207;
	cv=none; b=aAKC4kQTyodpuf1XSoqyQ8qgSXGxhW0RQFnX9yXgH3mkWh2Mr+oKypfVMXM7VJ/KCcepsEcVIZ3hjXqxGtW//uMuMajfGz6XNBkuPCzAo8x5LU6sCK7wDTaGDcdvuTsFRzW+Ky37kS9c719BXMa1IAw0M/5uUOpRf+oaGrRWaI2jdknLT1DbTP+R5urqCPskOWTXu1hWLsRC1/WvB0649cZe+TR0eqWs20V/YsWz+VfmVLSNmBy/PfhrklyTwyS9p7QH7wnlVo8Z2Eh1l5G6wn8uT7p7oYn7mTM0xX+nhx/aDT2JPCbI0SwD9VlHbu1fiNTTr1vU/+RK+8Jeb400iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781112207; c=relaxed/relaxed;
	bh=kSnU05LP4qr/miE9bcmCtKHpcKuotIP+m7Vp5isT2ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fpoW+IjHhSbKXiY8fiiZPvVFjLI8bvuV6ljUqxtvABCrxNHAfYCN73gP38AdmdYTzrWMnj3SgejXSq/+AZwCp2B1TU6+8c5hDarLnwSQNph2vrRSiUswNmE2brr9DFToTshg0pSQco+ZH9uWx7B5wsjqLnmZfPN/phrihJif7wWMCBjZkt0pU1lxu5ozbF5II7Z4fnsQ1rhGAi02TiZDANmcJYvwlPjIW5X7MJs07oD98QTx/1GmJT0WpTCBBKnbUqmCmwxQsAN7tKZXEr+jz/uxSwsFFeJ1vlYjLmJGjyAyMKChCZhzAhvkK+O5PVuAa3H+fJ+6OUFDw4LrZ5REjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FTdEpimB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=karthiproffesional@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gbCKn4vRyz2xwH
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jun 2026 03:23:24 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bf3781ca51so64637335ad.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jun 2026 10:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781112202; x=1781717002; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSnU05LP4qr/miE9bcmCtKHpcKuotIP+m7Vp5isT2ME=;
        b=FTdEpimBfrLhwiRe3/daPqdv9cClfXb0GAlDzUABPgDbKjrxYsd1B1lmAaeAbcYia/
         9NL+XluWxYStAiDuAqgEr7G3962yv62nryFTPeedYxP632Tjp8yD2G+NEgSA9hJZTdaP
         QgM5FvNwCuLjcyl7yG/HvUz+uDAWsv8gDqxM6An/DVmbVtbPQJK23VKI1N8xx82kraFw
         ey2gSTqAMQqV3sHMfi1B8/88gphdgBzYBL2xABDeArlVfqGQ89khKE6RXF4KPSUz2vbJ
         Cq+JIfcobQc2Sy9nwbg+MgcqevkmsLba2hbp+ACH+CRR9JYwAUZOeEFFjDx69DEQTeVM
         NsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781112202; x=1781717002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kSnU05LP4qr/miE9bcmCtKHpcKuotIP+m7Vp5isT2ME=;
        b=a5+N7oVxCrGRv9FjLiXlSDu32QvEnYfJwWrbRlpfrrWZyaLUATQF4+QYQjkJtsVcfD
         0qJNL0VqByKLGb8baSuCznsKHb27cOLnifsoHgO77n62dC9ouK2TCAsreaR1GYBLVoQT
         dLYiNatYpuTuAsmccWl6gAWvsorVN/aiKsR8CBBt1K5vUPHDCSWyIHTnTIOvkwjVrQyU
         9xeTEximb8W2+KcuYmwV8qm1oZnGmmB8FLXfZnN9+y0eSlK6XOy1Zvakcx68EJ1t0X3h
         jkH+LnuIoSw/jCvn3z4m91VYvrVLvAdEGHL/vY6Hfb57cMACxEqGNAzrQi48f5Y2isIs
         vckA==
X-Forwarded-Encrypted: i=1; AFNElJ/u4x4tYhRFCluUuuDulNLHjMW4SCFfoSkDK1JbrGab4A2at0pQSrCqUN8kUJoUy3rhyjfyqdFyX3nJhuY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzo7PP/xlsPGSwTE0R4hmep7yRtZslSaTsBPwoDsJVp4Zb7wz50
	bNROPtn2Ep0NzBUJ4v4e4Rgna3oFNPA5slLUwbvDsexxPlKaXRx+wgCH
X-Gm-Gg: Acq92OGQ/0oOkAekRD6Wp+y/RE7CzBQ3gzKDWjyPHbR+9XmWbPYDI0iYus4MYDhweoU
	JzT/qhyN1wkeOLHl60k/tUpDAnaBTJFDDBWjHuZkoMs1tNPuMZb4tek4FnK41sF6/qS0VAPjKyy
	ajrpmCAEvORT7UReVN4MacS/ZZG88euU618IIAEwKBi0Kvz0sskleJp3zPi+Nxh3J30STZ2cyWA
	SwH7bILY/O05KgrYawG5LAVH/YaO9qaT30AN2FsA6vIDL+I2MGEX4DbeyMrnik9tMVduyTSYUUG
	WfSucLyLWv2Fu6fmLdWcH7DD35U0OAqYR/iP9N6K6BDLkgDrFiEiMdGlQohfSTlNvyHO8JuiC9a
	h5BXnbeaKLwdeSZwqmREwSml2B8lqJnmsAPUtce7lgpkTC71ZYE+UDNdfQUHLg1LKEtzAIxQsQ+
	kEOqwpHbH1itJLVCBn/ikZ0IvOdGSMWquTXRlwo43TQtS/Yv2gW6Dtn386WqDX2RmmALWW075Wj
	DbdPA==
X-Received: by 2002:a17:902:c946:b0:2bf:281f:19ec with SMTP id d9443c01a7336-2c1e8208778mr304491405ad.24.1781112202455;
        Wed, 10 Jun 2026 10:23:22 -0700 (PDT)
Received: from LAPTOP-97G9G880.domain.name ([106.222.202.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2d9bb2139sm2247585ad.69.2026.06.10.10.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:23:21 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: andrew@codeconstruct.com.au
Cc: joel@jms.id.au,
	andrew@aj.id.au,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Karthikeyan KS <karthiproffesional@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5] soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read
Date: Wed, 10 Jun 2026 17:23:10 +0000
Message-ID: <20260610172310.163321-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
References: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jms.id.au,aj.id.au,kernel.org,lists.infradead.org,lists.ozlabs.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-4221-lists,linux-aspeed=lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[karthiproffesional@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:joel@jms.id.au,m:andrew@aj.id.au,m:kees@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:karthiproffesional@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karthiproffesional@gmail.com,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06EF966D51C

put_fifo_with_discard() acts as both producer and consumer on the kfifo:
it calls kfifo_skip() (advances out) and kfifo_put() (advances in) from
the IRQ handler without synchronizing with snoop_file_read(), which also
consumes via kfifo_to_user(). On SMP systems this concurrent access can
leave (in - out) larger than the ring buffer, so __kfifo_to_user()'s clamp
to (in - out) is ineffective and kfifo_copy_to_user() can attempt a
copy_to_user() past the kmalloc-2k backing store:

  usercopy: Kernel memory exposure attempt detected from SLUB object
  'kmalloc-2k' (offset 0, size 2049)!
  kernel BUG at mm/usercopy.c!
  Call trace:
   usercopy_abort
   __check_heap_object
   __check_object_size
   kfifo_copy_to_user
   __kfifo_to_user
   snoop_file_read
   vfs_read

Serialize kfifo access with a per-channel spinlock. The reader drains
into a bounce buffer under the lock with kfifo_out_spinlocked() and then
copies to userspace after dropping it, since copy_to_user() may sleep on
a page fault.

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Cc: stable@vger.kernel.org
Signed-off-by: Karthikeyan KS <karthiproffesional@gmail.com>
---
Andrew,

Thanks for the review.

Changes since v4:
- Use __free(kfree) for automatic cleanup
- Allocate clamped count instead of full SNOOP_FIFO_SIZE
- Use kfifo_out_spinlocked() in snoop_file_read
- Use scoped_guard(spinlock) in put_fifo_with_discard

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index b03310c0830d..c9c87a794228 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/dev_printk.h>
 #include <linux/interrupt.h>
@@ -74,6 +75,7 @@ struct aspeed_lpc_snoop_channel_cfg {
 struct aspeed_lpc_snoop_channel {
 	const struct aspeed_lpc_snoop_channel_cfg *cfg;
 	bool enabled;
+	spinlock_t		lock;    /* serialises @fifo: irq producer vs reader */
 	struct kfifo		fifo;
 	wait_queue_head_t	wq;
 	struct miscdevice	miscdev;
@@ -114,6 +116,7 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
 				size_t count, loff_t *ppos)
 {
 	struct aspeed_lpc_snoop_channel *chan = snoop_file_to_chan(file);
+	u8 *buf __free(kfree) = NULL;
 	unsigned int copied;
 	int ret = 0;
 
@@ -125,9 +128,16 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
 		if (ret == -ERESTARTSYS)
 			return -EINTR;
 	}
-	ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
-	if (ret)
-		return ret;
+
+	count = min_t(size_t, count, SNOOP_FIFO_SIZE);
+
+	buf = kmalloc(count, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	copied = kfifo_out_spinlocked(&chan->fifo, buf, count, &chan->lock);
+	if (copied && copy_to_user(buffer, buf, copied))
+		return -EFAULT;
 
 	return copied;
 }
@@ -153,9 +163,11 @@ static void put_fifo_with_discard(struct aspeed_lpc_snoop_channel *chan, u8 val)
 {
 	if (!kfifo_initialized(&chan->fifo))
 		return;
-	if (kfifo_is_full(&chan->fifo))
-		kfifo_skip(&chan->fifo);
-	kfifo_put(&chan->fifo, val);
+	scoped_guard(spinlock, &chan->lock) {
+		if (kfifo_is_full(&chan->fifo))
+			kfifo_skip(&chan->fifo);
+		kfifo_put(&chan->fifo, val);
+	}
 	wake_up_interruptible(&chan->wq);
 }
 
@@ -228,6 +240,7 @@ static int aspeed_lpc_enable_snoop(struct device *dev,
 		return -EBUSY;
 
 	init_waitqueue_head(&channel->wq);
+	spin_lock_init(&channel->lock);
 
 	channel->cfg = cfg;
 	channel->miscdev.minor = MISC_DYNAMIC_MINOR;
-- 
2.43.0


