Return-Path: <linux-aspeed+bounces-4141-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AEmL/OqF2rWMwgAu9opvQ
	(envelope-from <linux-aspeed+bounces-4141-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 May 2026 04:39:47 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 262595EBEA8
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 May 2026 04:39:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gQrL63tNkz2y1W;
	Thu, 28 May 2026 12:39:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779935982;
	cv=none; b=aoORPNvHwKwj6JRKgE2nb9tGqsL1a5s3Odftub1Sq5PpX4JuPQeBRjXuUxJPV+ZltGvVYbsSvFn2W3J72u1vlmyB2+ZbYzPWWm1+2IyFgAxae/PRgj71zC/F602/Cd6ujvTrxLGp0iRhlqsxr+vCOtcNlWAL1S5U4DTIY8B8umvU0Kf3b2eH6O4rISjFI/f8yySAtKs3hhzKv7rEtOXAaeAumtr7pYiZ0fjudcQ9P92AGq3s4KIot0AOWShHUnk4yIzsH0Xz2ibFpV9qzBRCQrmU5lo/aa2fK0F/3sAAzUQjZKEJXj2hVwL71/aG77FXksLfoo1OMdzSkHmMC+mRqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779935982; c=relaxed/relaxed;
	bh=eM5Kf2P2muqD9TDUqOMWCASBAGRx4JfmKuvQ3t+VEmc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dfkH/4Dlvz2GNOTh4sKFV8Hs+Q+JIQPOxMMQd2twMovNI2PuXazN+YpSecmAUa3uFpWXvqc0UgUPzO+Ca5uxZwT1aE0aPxihK2LzwNXqV94DL1Py4LXIKyWuk1G1Y0TdeupnlHW6jjxgurHRjLNBjLwDSjRlDTNAuETqOzSo54FeeQAi12cIhEykinYTWOHjBaApH2d2xbLvQtKJV1xSzBNJddw3RhaW44aLOy5tIlzMiVJH89KBCaDteBef+Spc7cMBPgNVeqrGrj+UXQblZOdg9ChEPswRyaAQnndcCUwxdMF+Ja624DuGSyfLHNFe4mosWnqKVUGexAm+A4popA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Z35J1pDk; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Z35J1pDk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gQrL50mY5z2xpt
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 May 2026 12:39:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779935979;
	bh=eM5Kf2P2muqD9TDUqOMWCASBAGRx4JfmKuvQ3t+VEmc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z35J1pDkWScazd7mwG3uLPYiBbgI8AxeSF82eyetT7NzyYANr9E5hOepMlXVCJckG
	 KgVIdUD0+Gg3vqMgmAOU902wo59c1AzBwTAnP6koDdAKWspvlPE0Nn9RbnrNolWruK
	 LEq5FHltSck7rbMkXEgQPqNX5bo/tuXDQxggQOE6JRSFmSY31k2lLmZBHOQWSS4FCL
	 3ANQpOj+R49xpC6TBKkZE34Bzr2Zmv2lQtv7nn4DQy08I4iFSvLY9tJQPKsLjLJaYS
	 kekFyQCTWCAg1UW1SiRzE5LBv5JNYSm4QRlz2uqrrdwvEMyiJ41sJh9Mm8fq3hUzpt
	 3rSQDL7upkB3Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9171B6001B;
	Thu, 28 May 2026 10:39:35 +0800 (AWST)
Message-ID: <1e2b77c7916259e3e269d19f637c29427c175350.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3] soc: aspeed: lpc-snoop: Fix usercopy overflow in
 snoop_file_read
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Karthikeyan KS <karthiproffesional@gmail.com>
Cc: joel@jms.id.au, andrew@aj.id.au, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Thu, 28 May 2026 12:09:34 +0930
In-Reply-To: <20260527175939.2939714-1-karthiproffesional@gmail.com>
References: 
	<53952f011f2c57ad28d6f864317054a2a34922e5.camel@codeconstruct.com.au>
	 <20260527175939.2939714-1-karthiproffesional@gmail.com>
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
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-4141-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:karthiproffesional@gmail.com,m:joel@jms.id.au,m:andrew@aj.id.au,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:mid,codeconstruct.com.au:dkim]
X-Rspamd-Queue-Id: 262595EBEA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Karthikeyan,

On Wed, 2026-05-27 at 17:59 +0000, Karthikeyan KS wrote:
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/a=
speed-lpc-snoop.c
> index eceeaf8df..ef6697a42 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -60,6 +60,7 @@ struct aspeed_lpc_snoop_model_data {
> =C2=A0
> =C2=A0struct aspeed_lpc_snoop_channel {
> =C2=A0	struct kfifo		fifo;
> +	spinlock_t		lock;
> =C2=A0	wait_queue_head_t	wq;
> =C2=A0	struct miscdevice	miscdev;
> =C2=A0};
> @@ -93,7 +94,11 @@ static ssize_t snoop_file_read(struct file *file, char=
 __user *buffer,
> =C2=A0		if (ret =3D=3D -ERESTARTSYS)
> =C2=A0			return -EINTR;
> =C2=A0	}
> +
> +	spin_lock_irq(&chan->lock);
> =C2=A0	ret =3D kfifo_to_user(&chan->fifo, buffer, count, &copied);
> +	spin_unlock_irq(&chan->lock);

This seems inappropriate and I expect is flagged if you compile with
CONFIG_PROVE_LOCKING=3Dy or CONFIG_DEBUG_ATOMIC_SLEEP=3Dy. I suggest both
if you're not already.

Further, I hit conflicts when applying your change on v7.1-rc5. Can you
please ensure you develop, build and test on recent releases.

Thanks,

Andrew

