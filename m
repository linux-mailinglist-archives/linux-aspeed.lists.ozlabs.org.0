Return-Path: <linux-aspeed+bounces-4074-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBECJwmIC2p1IwUAu9opvQ
	(envelope-from <linux-aspeed+bounces-4074-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 23:43:37 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FF957406E
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 23:43:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKBBY6YXfz2xpn;
	Tue, 19 May 2026 07:43:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::731"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779140613;
	cv=none; b=nPC1srp1XrBXPPX250Er5ZD6FYhaa3+Gs9ai1ewtOaZwvfOtQKGBoCcfX6VaPxKtuGv3pjOqrqkIueNT3wvjIMVfpY0DGoFQ12OizUBfAuWn9kSLPj/6z7+ovHIXjjW1CZbAZuMzbZcuzQY662HHCrbf3mqUzxjzQibkEtBqUkndAUB+l3CqtIEQh3uQPOL88IWLl9MMgIzBumSgdQxA1txgJEKkV+i2igCS6EgCFNnBqv099VcplEL0cjL658Ht7HtOE9rY29Y2sgGfGrL6I2zGrUMsJ/y8ew9Vu/3XyzGViW88M22G8eP0zsM8/mOiGTAqD7HAWXz46G42J9B4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779140613; c=relaxed/relaxed;
	bh=OANDM8Na3472eWZUNdpiSE+WZ0j53b9Df8FisM//ZFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwz1/xnkNraR9XdKTZ83E0/kQbngmQXg3mznrgocfn5nMod7oC1vvWuLX4eBx0iOeU7Tda14DqM8VXKBsmXabYeU1tr53Hf4n3XsJowgRNrK3J4Y7u6Sd4hPE7m7U7Zs5xUu7JimA+TvV6yz4ItJckdNPJyMjxaiAi54N8oo/lF5+L17NXrfFBkToSJHAAUclE0UsZAneqKy1/qggjFidkAHthLfJM1/Aby00bsN36SsXy4BnJqyKJ6g1QBtLIK1945nZJzSc9sSibdLOs/aBTkm4lATrKc8a9dnpNWyCtevX+v2IldeDaSv1bVreKMRwNhqjMYgatRsaxQpWYHlcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; dkim=pass (2048-bit key; unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=VQegutTZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com; envelope-from=stern@g.harvard.edu; receiver=lists.ozlabs.org) smtp.mailfrom=g.harvard.edu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=VQegutTZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=g.harvard.edu (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com; envelope-from=stern@g.harvard.edu; receiver=lists.ozlabs.org)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gKBBW3zcCz2xd2
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 May 2026 07:43:29 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-90ca6f20872so484782285a.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 14:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1779140607; x=1779745407; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OANDM8Na3472eWZUNdpiSE+WZ0j53b9Df8FisM//ZFk=;
        b=VQegutTZ8Bmb+JOfX9DXk2K4Tnq2+PLmQGeDmRixT+dw8S7gn5s4Bl/0Ekh3of5Lyg
         CjTwSfUeYQFVHmuAxOdhMGk4ok5yZEhL+3ObZ9qxtQQlDCy1asY6L02du96qenp5eTaa
         CKg1Hid9QGCfzcjp7tTdQzaiVqU4M2Z0FjG9Ccgm5pK9vJfpuEWGlZzHRY6/r9gQMJyL
         I9DJJEk2obczBHlOrjOZqi/V1pNThT56+hAL7hXNwpWNqafSPbUsmetObY5Ggu7Wizei
         twF8a5y96NN16rg4Z2XM0Lz6akpDsK/XL7bl03Ul8/ZTk8C5Xx482+8OdwcVtPYV7XZs
         YLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779140607; x=1779745407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OANDM8Na3472eWZUNdpiSE+WZ0j53b9Df8FisM//ZFk=;
        b=o248tcCvT1qkQrn5VZBFZjks2/6JfM5//MeHZXEtY7xpriBOE159P3O6w/eUCmm3p4
         rWwP2CAJCbwOBUDzjYYihAS4dVaBhlKzrQV8ehHPV4L0AbKDUU69Yrwpr9dRcieyR3TT
         Xo7K/aG5cc1c78Ue1DDFTYyjzUv5LJO8OQzxe6iDZVNJBD+mpyZdjS83K6eiG+y0G45i
         AypuY2vGCkMJP7Wm13Kf8zTTNBYkbk4ffvE9jDondOXNnQP14PYsK6jMHeE/lsqphHz6
         18mJe22/KM440uCjPDZK9DgL3v4V7UWwWnvOEXDJEmisNb1Pl6s8oHODU1ZeVAGJEd0i
         IdPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qqK/D97h1kB3V0h9Z2PtE/Lu9zRKJYGDrI3WLihzyUgrG3kr5+5uB1t501QhFTW+ck5MXPhoJ7zRnmJ0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzGM+R7WmQgYaw3wF2pZ8Rg10SZoBLH7nblixQmoewUzclH58dK
	MegcJ1dCBpoIbUVc3ZA37JRwGSSeM20EcYWvnsf0epoXHvdOvV+AG3x8cBRapo7QsQ==
X-Gm-Gg: Acq92OFebltwGWYHEqNW2tdkX+BfIrYLVNO2Z0m2K8EJDL3AHGIteP20xk6ZrDTIXrx
	JhxbvlkOpZ0VV/N15b23nVcN/vWgxhbZary+tqjo9gQU20+4/TtJUfkyOb1ZP1hwUaSRumnKaEr
	MTMgZ3jfNYOAXHCW3DKWuRoJ2UGUR0JpZT4W4B2e2CQLYozTGdAEZCqGz4L1NQv+d1DvyPcx1Uk
	wM27OV2MTjMMvrwtfwE1q41pakCEoA2hZuzARGFZIvAZ9xOK5eq9e+/wjlqAk9ST6aoFYL/mUZE
	2eS0VupPXjpk15RT9S4L0Q1fz/N8eA+2qdF2Zadl2fw5DvSU+E/aiNIzfOLiurZxrdZIetoSSeA
	feNQUfzDM1eaqUogGHfob0YdzohKGdKdAyZFbgIMPzSX3KeE20B0dEgRQA+jhNzoiuOpbNUyLHW
	Ph0rPoSZFyVBPQjIMjfEKL3PANdHc6ceX1Nh7n3CxkfSM=
X-Received: by 2002:a05:620a:2587:b0:8f1:9e59:21fa with SMTP id af79cd13be357-911cd858a7amr2197388885a.5.1779140607206;
        Mon, 18 May 2026 14:43:27 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba182535sm1622387185a.8.2026.05.18.14.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 14:43:26 -0700 (PDT)
Date: Mon, 18 May 2026 17:43:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Neal Liu <neal_liu@aspeedtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: aspeed_udc: avoid past-the-end iterator in
 dequeue
Message-ID: <d659cf09-8136-4383-b61f-045b92d495db@rowland.harvard.edu>
References: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4074-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maoyixie.tju@gmail.com,m:andrew@codeconstruct.com.au,m:neal_liu@aspeedtech.com,m:gregkh@linuxfoundation.org,m:benh@kernel.crashing.org,m:joel@jms.id.au,m:andrew@aj.id.au,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:maoyixietju@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stern@rowland.harvard.edu,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 51FF957406E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 03:34:03PM +0800, Maoyi Xie wrote:
> From: Maoyi Xie <maoyixie.tju@gmail.com>
> 
> ast_udc_ep_dequeue() declares the loop cursor `req` outside the
> list_for_each_entry(). After the loop it tests `&req->req != _req`
> to decide whether the request was found. If the queue holds no
> match, `req` is past-the-end. It then aliases
> container_of(&ep->queue, struct ast_udc_request, queue) via offset
> cancellation. Whether that synthetic address equals `_req` depends
> on heap layout. The function can return 0 without dequeueing
> anything.
> 
> Use the cursor-vs-result idiom from the sibling aspeed-vhub driver,
> ast_vhub_epn_dequeue() in drivers/usb/gadget/udc/aspeed-vhub/epn.c.
> A separate `iter` walks the list. `req` is set only when a request
> matches. After the loop, `req` is NULL if nothing matched.
> 
> The same idiom is used by the other UDC drivers in
> drivers/usb/gadget/udc/ (at91_udc, atmel_usba_udc, dummy_hcd,
> fsl_qe_udc, fsl_udc_core, goku_udc, gr_udc, lpc32xx_udc,
> max3420_udc, net2280, omap_udc, pxa25x_udc, pxa27x_udc, udc-xilinx,
> bcm63xx_udc).
> 
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
>  drivers/usb/gadget/udc/aspeed_udc.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -692,26 +692,30 @@
>  {
>  	struct ast_udc_ep *ep = to_ast_ep(_ep);
>  	struct ast_udc_dev *udc = ep->udc;
> -	struct ast_udc_request *req;
> +	struct ast_udc_request *req = NULL, *iter;
>  	unsigned long flags;
>  	int rc = 0;
>  
>  	spin_lock_irqsave(&udc->lock, flags);
>  
>  	/* make sure it's actually queued on this endpoint */
> -	list_for_each_entry(req, &ep->queue, queue) {
> -		if (&req->req == _req) {
> -			list_del_init(&req->queue);
> -			ast_udc_done(ep, req, -ESHUTDOWN);
> -			_req->status = -ECONNRESET;
> -			break;
> -		}
> +	list_for_each_entry(iter, &ep->queue, queue) {
> +		if (&iter->req != _req)
> +			continue;
> +		req = iter;
> +		break;
>  	}

There's nothing wrong with doing it this way, and this is how the other 
drivers do it.  Still, organizing the loop in this way does look a 
little strange.  Consider this instead:

	list_for_each_entry(iter, &ep->queue, queue) {
		if (&iter->req == _req) {
			req = iter;
			break;
		}
	}

Alan Stern

