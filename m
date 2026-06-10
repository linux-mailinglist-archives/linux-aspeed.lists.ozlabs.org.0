Return-Path: <linux-aspeed+bounces-4215-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uZJ5BHFOKWopUgMAu9opvQ
	(envelope-from <linux-aspeed+bounces-4215-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jun 2026 13:45:53 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 935FE668ECC
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jun 2026 13:45:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codeconstruct.com.au header.s=2022a header.b=SBng9vAF;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4215-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4215-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=codeconstruct.com.au;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gb3rF1V0Mz2xll;
	Wed, 10 Jun 2026 21:45:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781091949;
	cv=none; b=EwYZFKzkr5oUF9UuZWC1BN64PyjE1fMHuozREdw8ULTiBLplGdqc1RROY6b/ETx/9nm48jNRTeaQ5o7epiAdn8McxtXLPDZtffJZk/aS59Yvflv9S8fk71AmuyL7uy/q521/GcS49+0WLMMsxUVgbGHdyVW5f1zYAqy40qY/7lAL0jfSVB4mFvfXZudaXiFDlXK1s/0IPgAcn6x3pb2QAKLqWo4tO+IHuFmTKfK1GEoy9/qI0ojUZIgdBd2QYZt+NDbu+4PQlm4EL13DpamcIoAkJ6mTGVGgBxWfykxtR6kejh5XPkrCdDvPgD6HiNg29+pyyKLbM1dCcXy2tCmaBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781091949; c=relaxed/relaxed;
	bh=x06EGkAQraU+3g7/QufOyAMDQPgvhh3FNld33Xss7GI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j7J3LxAwqn7y8SED1rHe8Xip0VYzTcjqePnEa4lhyUQ7tjxFAV5CqJBUITTkHU3susXAeY+zZQyAafEbY09UWkPINSInSmVWF+JdAgTvlkthAjfnKC3mnzHk1k3/bYp/gEljBWH903NHSBYvoA87/Zbfn8pQv82OWmgRf/puqQJ7XHJnj92Xrz6on3lSWIeBdY3NSNgHoOaW/VPODXl8TqbHUnnZckDmTES5smPI987Ht0e2u2IBJLagK+TkvY6+hZcJT7AqyjQw9XKfqxfcRax45TOuhpWObCR0xEQqMQFc0ogYggmTuYLiTxBHVWoQGL9K8uyCFPrdzZatZupKnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SBng9vAF; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gb3rD3N61z2xYg
	for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jun 2026 21:45:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781091947;
	bh=x06EGkAQraU+3g7/QufOyAMDQPgvhh3FNld33Xss7GI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SBng9vAFXA745uxhIHrClOk55WICJFXkW6PO4pR5skEcxvS9cTQinyWUKmpDweK5F
	 oUlxG+kXGqnQmGCADLDvvGpDc/7F4hxQrXiiOw7I2DbBa3+fl0UzCvW/yfRmATF8ID
	 +c0PR9l/fX6KBatMXetfTiYrIwHAVN3mF+KhlnjrlSf06kqs9XEbkFSmFVHgS5mFOP
	 vnpVN6+Dg0Qvhn8EB23kB721IjbXdazhQ2rrTqU/SsWhRcfJQINd2Lvqd0kYhD5PRx
	 bHR5mi6vyvIaP1Eikb4SlBm9/x++dN5Ej8V7hYk7rv2ifV1cv3JeYBcM3rfuacYerA
	 jy4z2R72fzf3Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8EF8760A14;
	Wed, 10 Jun 2026 19:45:46 +0800 (AWST)
Message-ID: <9f2caf9887177bad39525a6713325c252ad47dcb.camel@codeconstruct.com.au>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: check endpoint DMA allocation
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ruoyu Wang <ruoyuw560@gmail.com>, Neal Liu <neal_liu@aspeedtech.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 10 Jun 2026 21:15:46 +0930
In-Reply-To: <20260608081948.3-1-ruoyuw560@gmail.com>
References: <20260608081948.3-1-ruoyuw560@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-4215-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,aspeedtech.com,linuxfoundation.org];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ruoyuw560@gmail.com,m:neal_liu@aspeedtech.com,m:gregkh@linuxfoundation.org,m:joel@jms.id.au,m:linux-aspeed@lists.ozlabs.org,m:linux-usb@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-aspeed];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp,codeconstruct.com.au:dkim,codeconstruct.com.au:mid,codeconstruct.com.au:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 935FE668ECC

On Mon, 2026-06-08 at 16:19 +0800, Ruoyu Wang wrote:
> ast_udc_probe() allocates a coherent DMA buffer used as the backing store
> for endpoint buffers. ast_udc_init_ep() derives per-endpoint buffer
> pointers from udc->ep0_buf, so a failed allocation is dereferenced during
> probe.
>=20
> Check the allocation before endpoint setup. The existing probe error path
> called ast_udc_remove(), which unregisters the gadget unconditionally and
> is not safe before usb_add_gadget_udc() succeeds. Add a local cleanup
> helper for probe failures so pre-registration failures only unwind the
> resources that were actually initialized.
>=20
> This was found by a local static analysis checker for unchecked allocator
> returns while scanning Linux 6.16. The change was checked by applying it
> to current mainline and by running checkpatch. I do not have access to
> Aspeed UDC hardware, so no runtime testing was performed.
>=20
> Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
> Note: a 2022 patch attempted to add only a NULL check for this
> allocation:
> https://lore.kernel.org/all/20221213025120.23149-1-jiasheng@iscas.ac.cn/
>=20
> This version also fixes the probe unwind path so the clock is disabled
> on allocation failure and usb_del_gadget_udc() is not called before the
> gadget has been registered.
>=20
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc=
/aspeed_udc.c
> index 7fc6696b7..809a7d5b7 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -1434,11 +1434,34 @@ static void ast_udc_init_hw(struct ast_udc_dev *u=
dc)
> =C2=A0	ast_udc_write(udc, 0, AST_UDC_EP0_CTRL);
> =C2=A0}
> =C2=A0
> +static void ast_udc_cleanup(struct platform_device *pdev)
> +{
> +	struct ast_udc_dev *udc =3D platform_get_drvdata(pdev);
> +	unsigned long flags;
> +	u32 ctrl;
> +
> +	spin_lock_irqsave(&udc->lock, flags);
> +
> +	/* Disable upstream port connection */
> +	ctrl =3D ast_udc_read(udc, AST_UDC_FUNC_CTRL) & ~USB_UPSTREAM_EN;
> +	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
> +
> +	clk_disable_unprepare(udc->clk);
> +
> +	spin_unlock_irqrestore(&udc->lock, flags);
> +
> +	if (udc->ep0_buf)
> +		dma_free_coherent(&pdev->dev,
> +				=C2=A0 AST_UDC_EP_DMA_SIZE * AST_UDC_NUM_ENDPOINTS,
> +				=C2=A0 udc->ep0_buf,
> +				=C2=A0 udc->ep0_buf_dma);
> +
> +	udc->ep0_buf =3D NULL;
> +}
> +
> =C2=A0static void ast_udc_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct ast_udc_dev *udc =3D platform_get_drvdata(pdev);
> -	unsigned long flags;
> -	u32 ctrl;
> =C2=A0
> =C2=A0	usb_del_gadget_udc(&udc->gadget);
> =C2=A0	if (udc->driver) {
> @@ -1453,23 +1476,7 @@ static void ast_udc_remove(struct platform_device =
*pdev)
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> -	spin_lock_irqsave(&udc->lock, flags);
> -
> -	/* Disable upstream port connection */
> -	ctrl =3D ast_udc_read(udc, AST_UDC_FUNC_CTRL) & ~USB_UPSTREAM_EN;
> -	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
> -
> -	clk_disable_unprepare(udc->clk);
> -
> -	spin_unlock_irqrestore(&udc->lock, flags);
> -
> -	if (udc->ep0_buf)
> -		dma_free_coherent(&pdev->dev,
> -				=C2=A0 AST_UDC_EP_DMA_SIZE * AST_UDC_NUM_ENDPOINTS,
> -				=C2=A0 udc->ep0_buf,
> -				=C2=A0 udc->ep0_buf_dma);
> -
> -	udc->ep0_buf =3D NULL;
> +	ast_udc_cleanup(pdev);
> =C2=A0}
> =C2=A0
> =C2=A0static int ast_udc_probe(struct platform_device *pdev)
> @@ -1523,6 +1530,10 @@ static int ast_udc_probe(struct platform_device *p=
dev)
> =C2=A0					=C2=A0 AST_UDC_EP_DMA_SIZE *
> =C2=A0					=C2=A0 AST_UDC_NUM_ENDPOINTS,
> =C2=A0					=C2=A0 &udc->ep0_buf_dma, GFP_KERNEL);
> +	if (!udc->ep0_buf) {
> +		rc =3D -ENOMEM;
> +		goto err_disable_clk;
> +	}
> =C2=A0
> =C2=A0	udc->gadget.speed =3D USB_SPEED_UNKNOWN;
> =C2=A0	udc->gadget.max_speed =3D USB_SPEED_HIGH;
> @@ -1553,20 +1564,20 @@ static int ast_udc_probe(struct platform_device *=
pdev)
> =C2=A0	udc->irq =3D platform_get_irq(pdev, 0);
> =C2=A0	if (udc->irq < 0) {
> =C2=A0		rc =3D udc->irq;
> -		goto err;
> +		goto err_cleanup;
> =C2=A0	}
> =C2=A0
> =C2=A0	rc =3D devm_request_irq(&pdev->dev, udc->irq, ast_udc_isr, 0,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KBUILD_MODNAME, udc);
> =C2=A0	if (rc) {
> =C2=A0		dev_err(&pdev->dev, "Failed to request interrupt\n");
> -		goto err;
> +		goto err_cleanup;
> =C2=A0	}
> =C2=A0
> =C2=A0	rc =3D usb_add_gadget_udc(&pdev->dev, &udc->gadget);
> =C2=A0	if (rc) {
> =C2=A0		dev_err(&pdev->dev, "Failed to add gadget udc\n");
> -		goto err;
> +		goto err_cleanup;
> =C2=A0	}
> =C2=A0
> =C2=A0	dev_info(&pdev->dev, "Initialized udc in USB%s mode\n",
> @@ -1574,9 +1585,14 @@ static int ast_udc_probe(struct platform_device *p=
dev)
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +err_disable_clk:
> +	clk_disable_unprepare(udc->clk);
> +	goto err;
> +err_cleanup:
> +	ast_udc_cleanup(pdev);
> +	goto err;
> =C2=A0err:

That last goto is unnecessary.

However, I find it unsettling that in a patch fixing resource handling
we add a mildly convoluted cleanup path, with portions jumping over
each other in this way.

The err_disable_clk label is only used once, and itself jumps down to
the err label. This is the case because beyond its goto we free udc-
>ep0_buf in ast_udc_cleanup(). I think it would make more sense to move
the call to clk_disable_unprepare() into the conditional body of the
allocation failure test, then change its goto label to 'err'. That way
the above hunk becomes:

   +err_cleanup:
   +    ast_udc_cleanup(pdev);
    err:
        ...

Which seems a bit more natural.

Andrew

> =C2=A0	dev_err(&pdev->dev, "Failed to udc probe, rc:0x%x\n", rc);
> -	ast_udc_remove(pdev);
> =C2=A0
> =C2=A0	return rc;
> =C2=A0}

