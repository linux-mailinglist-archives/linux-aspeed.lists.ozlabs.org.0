Return-Path: <linux-aspeed+bounces-4223-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EbY/JJkiKmqUjAMAu9opvQ
	(envelope-from <linux-aspeed+bounces-4223-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jun 2026 04:51:05 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C08A766DE24
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jun 2026 04:51:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codeconstruct.com.au header.s=2022a header.b=SYVLyqrQ;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4223-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4223-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=codeconstruct.com.au;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gbRwb5Q61z2xll;
	Thu, 11 Jun 2026 12:50:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781146255;
	cv=none; b=CFjvCIxYw31JE3OIP1mvJP9saBRAMfOmlRT5SxiY5sZka/pvWFkxAevuLC8wSSiisr/rxd4kkXREx8jSgeTysriA+7Dbi4lWm60DsCWLCUb31KMNU0s3mzML4sFXnr/CnOOrUpemTI4y45jMf4fgwk7ICmdkQ47IbLrqkJPmDeUW1ykyY9+givM0ltGwLVmt0VUO9+m44a4ARZG5Yl6lpZk37cToTWInjDxtn117d6KiSTtP5sO8QCePjpXpDqDdYVVPbq4HvlmUL9+2E9RUaFazJSuBQ1ypml1v4bPPdtg74GO3BJ6p3QYG8ef63Ao9h2Nndtco/YFtt4iAjGISsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781146255; c=relaxed/relaxed;
	bh=jC17BLRupxjFh4QurP21wywIDB1dwNBEJxTReffswGw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OQijQeOa+v5Etgg7nCaV3Z1vTo+bOLphPuwnppU4lz24k9ym5CJ5Ce0UqNZiEv6a1Qj59y8kCkQADqwK9vB5XfzYS7JfL8drSNvy12T7ZLajxMown4oDsZzo3saCy9RKAzasH1vux4qHMn39Wh03it9zM5Ih46q8Z/CziKAIYwBrHzlj/6p+J2Kx+pyVjcnH7E3iAlqKzs+S9dUFfsWYy0jUcxWO9kkS7WKtZ81ebfueNvktkba0ZcM2+gTJJywMctsJHemINfaE24vc11P7TaAu7j0pChOeT9PNDtImRlxjzMJJFDPi/D5MlNCJTKmxacpIbK5ybdl7FwcMNISfEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SYVLyqrQ; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gbRwZ5bNDz2xl6
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jun 2026 12:50:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781146253;
	bh=jC17BLRupxjFh4QurP21wywIDB1dwNBEJxTReffswGw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SYVLyqrQiN1Offva8UPZ/gcqnw2zJNMdKsotwp/JLCuPsS3QbUUTWLgd3VSMGSx4r
	 5lNrAFl0iQ3VyHQIhNRslyvUoQegK1YJJyYIAmSLlcH7SQ295Iurh6pvD2LRT0tS+2
	 Vy7YqlcusxaPBLVl7Qr8IDkViYYromvKsx1lbSv2soYjuVT2VMp/P5xdFe3MAkHBbc
	 TQxiaY/7wvy1R/wqtie29/p7FPHVYpvL0c+u/zRts/P49RXY/SZGPdtIdqtW8GiU10
	 r9MpCEybw18qEdiOALgdqtormaeygxfVlaMpcKEFkh2Rx077FgY1Q7uEdgLXbpMoCc
	 GaFVW+6bDAG4A==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6573D60A0C;
	Thu, 11 Jun 2026 10:50:51 +0800 (AWST)
Message-ID: <64f8d88bf4cd72d8120baaa304dfe34bb66cbe0b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5] soc: aspeed: lpc-snoop: Fix usercopy overflow in
 snoop_file_read
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Karthikeyan KS <karthiproffesional@gmail.com>
Cc: joel@jms.id.au, andrew@aj.id.au, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	stable@vger.kernel.org
Date: Thu, 11 Jun 2026 12:20:50 +0930
In-Reply-To: <20260610172310.163321-1-karthiproffesional@gmail.com>
References: 
	<033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
	 <20260610172310.163321-1-karthiproffesional@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4223-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:karthiproffesional@gmail.com,m:joel@jms.id.au,m:andrew@aj.id.au,m:kees@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-aspeed];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C08A766DE24

Hi Karthikeyan,

On Wed, 2026-06-10 at 17:23 +0000, Karthikeyan KS wrote:
> put_fifo_with_discard() acts as both producer and consumer on the kfifo:
> it calls kfifo_skip() (advances out) and kfifo_put() (advances in) from
> the IRQ handler without synchronizing with snoop_file_read(), which also
> consumes via kfifo_to_user(). On SMP systems this concurrent access can
> leave (in - out) larger than the ring buffer, so __kfifo_to_user()'s clam=
p
> to (in - out) is ineffective and kfifo_copy_to_user() can attempt a
> copy_to_user() past the kmalloc-2k backing store:
>=20
> =C2=A0 usercopy: Kernel memory exposure attempt detected from SLUB object
> =C2=A0 'kmalloc-2k' (offset 0, size 2049)!
> =C2=A0 kernel BUG at mm/usercopy.c!
> =C2=A0 Call trace:
> =C2=A0=C2=A0 usercopy_abort
> =C2=A0=C2=A0 __check_heap_object
> =C2=A0=C2=A0 __check_object_size
> =C2=A0=C2=A0 kfifo_copy_to_user
> =C2=A0=C2=A0 __kfifo_to_user
> =C2=A0=C2=A0 snoop_file_read
> =C2=A0=C2=A0 vfs_read
>=20
> Serialize kfifo access with a per-channel spinlock. The reader drains
> into a bounce buffer under the lock with kfifo_out_spinlocked() and then
> copies to userspace after dropping it, since copy_to_user() may sleep on
> a page fault.
>=20
> Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc ch=
ardev")
> Cc: stable@vger.kernel.org
> Signed-off-by: Karthikeyan KS <karthiproffesional@gmail.com>
> ---
> Andrew,
>=20
> Thanks for the review.
>=20
> Changes since v4:
> - Use __free(kfree) for automatic cleanup
> - Allocate clamped count instead of full SNOOP_FIFO_SIZE
> - Use kfifo_out_spinlocked() in snoop_file_read
> - Use scoped_guard(spinlock) in put_fifo_with_discard
>=20
> =C2=A0drivers/soc/aspeed/aspeed-lpc-snoop.c | 25 +++++++++++++++++++-----=
-
> =C2=A01 file changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/a=
speed-lpc-snoop.c
> index b03310c0830d..c9c87a794228 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -11,6 +11,7 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/bitops.h>
> +#include <linux/cleanup.h>
> =C2=A0#include <linux/clk.h>
> =C2=A0#include <linux/dev_printk.h>
> =C2=A0#include <linux/interrupt.h>
> @@ -74,6 +75,7 @@ struct aspeed_lpc_snoop_channel_cfg {
> =C2=A0struct aspeed_lpc_snoop_channel {
> =C2=A0	const struct aspeed_lpc_snoop_channel_cfg *cfg;
> =C2=A0	bool enabled;
> +	spinlock_t		lock;=C2=A0=C2=A0=C2=A0 /* serialises @fifo: irq producer v=
s reader */

I'd prefer we avoid trailing comments, which it seems you've added this
time around. Since you did that ...

> =C2=A0	struct kfifo		fifo;

... in this specific case we can improve on the comment, with:

   struct kfifo fifo __guarded_by(&lock);

More details here:

   https://docs.kernel.org/dev-tools/context-analysis.html

Adding a change along these lines currently produces:

   ../drivers/soc/aspeed/aspeed-lpc-snoop.c:164:32: warning: reading variab=
le 'fifo' requires holding spinlock '&aspeed_lpc_snoop_channel::lock' [-Wth=
read-safety-analysis]
     164 |         if (!kfifo_initialized(&chan->fifo))
         |                                       ^

I ended up applying this on top of your patch:

   diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
   index b35d74592964..9cba7be8c395 100644
   --- a/drivers/soc/aspeed/Makefile
   +++ b/drivers/soc/aspeed/Makefile
   @@ -4,3 +4,5 @@ obj-$(CONFIG_ASPEED_LPC_SNOOP)          +=3D aspeed-lpc-=
snoop.o
    obj-$(CONFIG_ASPEED_UART_ROUTING)      +=3D aspeed-uart-routing.o
    obj-$(CONFIG_ASPEED_P2A_CTRL)          +=3D aspeed-p2a-ctrl.o
    obj-$(CONFIG_ASPEED_SOCINFO)           +=3D aspeed-socinfo.o
   +
   +CONTEXT_ANALYSIS_aspeed-lpc-snoop.o    :=3D y
   diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/=
aspeed-lpc-snoop.c
   index 9165a543a250..7fa1a345acac 100644
   --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
   +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
   @@ -75,8 +75,8 @@ struct aspeed_lpc_snoop_channel_cfg {
    struct aspeed_lpc_snoop_channel {
           const struct aspeed_lpc_snoop_channel_cfg *cfg;
           bool enabled;
   -       spinlock_t              lock;    /* serialises @fifo: irq produc=
er vs reader */
   -       struct kfifo            fifo;
   +       spinlock_t              lock;
   +       struct kfifo            fifo __guarded_by(&lock);
           wait_queue_head_t       wq;
           struct miscdevice       miscdev;
    };
   @@ -161,9 +161,9 @@ static const struct file_operations snoop_fops =3D {
    /* Save a byte to a FIFO and discard the oldest byte if FIFO is full */
    static void put_fifo_with_discard(struct aspeed_lpc_snoop_channel *chan=
, u8 val)
    {
   -       if (!kfifo_initialized(&chan->fifo))
   -               return;
           scoped_guard(spinlock, &chan->lock) {
   +               if (!kfifo_initialized(&chan->fifo))
   +                       return;
                   if (kfifo_is_full(&chan->fifo))
                           kfifo_skip(&chan->fifo);
                   kfifo_put(&chan->fifo, val);
   @@ -240,7 +240,6 @@ static int aspeed_lpc_enable_snoop(struct device *de=
v,
                   return -EBUSY;
   =20
           init_waitqueue_head(&channel->wq);
   -       spin_lock_init(&channel->lock);
   =20
           channel->cfg =3D cfg;
           channel->miscdev.minor =3D MISC_DYNAMIC_MINOR;
   @@ -252,9 +251,11 @@ static int aspeed_lpc_enable_snoop(struct device *d=
ev,
           if (!channel->miscdev.name)
                   return -ENOMEM;
   =20
   -       rc =3D kfifo_alloc(&channel->fifo, SNOOP_FIFO_SIZE, GFP_KERNEL);
   -       if (rc)
   -               return rc;
   +       scoped_guard(spinlock_init, &channel->lock) {
   +               rc =3D kfifo_alloc(&channel->fifo, SNOOP_FIFO_SIZE, GFP_=
KERNEL);
   +               if (rc)
   +                       return rc;
   +       }
   =20
           rc =3D misc_register(&channel->miscdev);
           if (rc)
  =20
I prefer that we add the annotation as the compiler analysis provides
some comfort in contrast to the comment.

Otherwise, the rest of the fix seems okay to me.

Andrew

> =C2=A0	wait_queue_head_t	wq;
> =C2=A0	struct miscdevice	miscdev;
> @@ -114,6 +116,7 @@ static ssize_t snoop_file_read(struct file *file, cha=
r __user *buffer,
> =C2=A0				size_t count, loff_t *ppos)
> =C2=A0{
> =C2=A0	struct aspeed_lpc_snoop_channel *chan =3D snoop_file_to_chan(file)=
;
> +	u8 *buf __free(kfree) =3D NULL;
> =C2=A0	unsigned int copied;
> =C2=A0	int ret =3D 0;
> =C2=A0
> @@ -125,9 +128,16 @@ static ssize_t snoop_file_read(struct file *file, ch=
ar __user *buffer,
> =C2=A0		if (ret =3D=3D -ERESTARTSYS)
> =C2=A0			return -EINTR;
> =C2=A0	}
> -	ret =3D kfifo_to_user(&chan->fifo, buffer, count, &copied);
> -	if (ret)
> -		return ret;
> +
> +	count =3D min_t(size_t, count, SNOOP_FIFO_SIZE);
> +
> +	buf =3D kmalloc(count, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	copied =3D kfifo_out_spinlocked(&chan->fifo, buf, count, &chan->lock);
> +	if (copied && copy_to_user(buffer, buf, copied))
> +		return -EFAULT;
> =C2=A0
> =C2=A0	return copied;
> =C2=A0}
> @@ -153,9 +163,11 @@ static void put_fifo_with_discard(struct aspeed_lpc_=
snoop_channel *chan, u8 val)
> =C2=A0{
> =C2=A0	if (!kfifo_initialized(&chan->fifo))
> =C2=A0		return;
> -	if (kfifo_is_full(&chan->fifo))
> -		kfifo_skip(&chan->fifo);
> -	kfifo_put(&chan->fifo, val);
> +	scoped_guard(spinlock, &chan->lock) {
> +		if (kfifo_is_full(&chan->fifo))
> +			kfifo_skip(&chan->fifo);
> +		kfifo_put(&chan->fifo, val);
> +	}
> =C2=A0	wake_up_interruptible(&chan->wq);
> =C2=A0}
> =C2=A0
> @@ -228,6 +240,7 @@ static int aspeed_lpc_enable_snoop(struct device *dev=
,
> =C2=A0		return -EBUSY;
> =C2=A0
> =C2=A0	init_waitqueue_head(&channel->wq);
> +	spin_lock_init(&channel->lock);
> =C2=A0
> =C2=A0	channel->cfg =3D cfg;
> =C2=A0	channel->miscdev.minor =3D MISC_DYNAMIC_MINOR;

