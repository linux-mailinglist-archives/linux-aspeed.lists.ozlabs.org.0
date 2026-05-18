Return-Path: <linux-aspeed+bounces-4058-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF5tC6z0CmpZ+QQAu9opvQ
	(envelope-from <linux-aspeed+bounces-4058-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 13:14:52 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C6556B5B9
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 13:14:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJwF402j3z2xpn;
	Mon, 18 May 2026 21:14:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779102887;
	cv=none; b=H23C5RrylIQJ7kq32ssimqPnzO+4CX4uLSVo5A+u90BVFydSQiyfPhecKJqh8hoSyH3VKGYAqhYhYz5YcKYRGz74YJizJlahSWwCo2LLaRsSTmwYdIjvVqrf/ojOAX98BcHg5qHwKqAHVOUE+ZWa6lwDpWSkYfvy3I9YvxgYqE3DlAe/1HQuA2C1w+r1WYmQMVVzEh/64PzGqgEnqIAhDpvrwJHVDlM79+LEbL6ULjPJTEuZimcq3roLFyJJVCVC4p2GFomnarOsRwFfvRRqgxI3mBdfXXRUu3yDnNcf6HaYo3t/XgRy+sNHv9yL5qxZJF4vm5gFcWwciYTY3mq7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779102887; c=relaxed/relaxed;
	bh=MyiVJtseOt/wJ/BPs1HhhYGYsoYkFKIrRec1rLZAZI0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JBhh5KevF5ohDIkc+eBXHFPoQ99eQ+IwO+oGxhnxQg1znzjOVVgmQUKzHzvNLetOx4mDXpxrSDMSMKpaIa+HZKE5G3nugDIYOnEPhBHM4bc4Zo71/s4kKxGj0iuhtZifp4EbnCD4fGOaLkEG+y57os48jp2Ef1Qmc4KSXBLgb7ksfMMEtGzAcQYw96Ps5Why2aeoVydisU6Kzd5YYUpz7RazdwRym517oQvpBKh7FhOClIpu61p4KVm2zg2KVmAaucpSx01E0uq/JyvJRZLx1acujgyUFlfyIDI+RX8gxBgUvgX45gm9KNN64qAqB/A3ifYw34+hmZnSTZKpZ5DH1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cCj2rXI2; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cCj2rXI2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJwF22sj6z2xRw
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 21:14:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779102884;
	bh=MyiVJtseOt/wJ/BPs1HhhYGYsoYkFKIrRec1rLZAZI0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cCj2rXI2vwTYNZ9dlszUmED2XdNsrvPJaEFtwGIc7M/JYYmjcPOlD9XkxlpjQTZmp
	 xE0onjChqeqq1mai/sMxpTKjnBTNxmmA6k7PXucLU3KsJ6tjzs3azRQYlrsWG3v6hR
	 vYrI9C57hueDpLr9/Nm0cumFPWn57AtUaOfYFu/n3QmMr88N1DWvWCb+jvjtg58fs/
	 /P93TneJIua8FIFIPyJqLZVZRTVryVZ7BUJ52BzU1+Fr69/0/q0pP6u1PQ3Kjw5n4u
	 sKDOLjXkfgEznH1SdkPlDdCUUMqe7jVFFnDYcI4GJQmWEix/rAtgtlqk4kn6g9oEZF
	 pjcklhGOMSYWw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CE7B06054D;
	Mon, 18 May 2026 19:14:43 +0800 (AWST)
Message-ID: <c3d474a1ec807e686c0b7ac70cc75f86898aee99.camel@codeconstruct.com.au>
Subject: Re: [PATCH] soc: aspeed: lpc-snoop: Fix usercopy overflow in
 snoop_file_read
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: karthikeyan K S <karthiproffesional@gmail.com>, joel@jms.id.au
Cc: jdelvare@suse.de, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 20:44:43 +0930
In-Reply-To: <CAP_JKPter_ggMMvUY=pDZyZupSQb5KWGVPeig41Uw2wBDXepMg@mail.gmail.com>
References: 
	<CAP_JKPter_ggMMvUY=pDZyZupSQb5KWGVPeig41Uw2wBDXepMg@mail.gmail.com>
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
X-Rspamd-Queue-Id: 50C6556B5B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:karthiproffesional@gmail.com,m:joel@jms.id.au,m:jdelvare@suse.de,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-4058-lists,linux-aspeed=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,jms.id.au];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,codeconstruct.com.au:mid,codeconstruct.com.au:dkim]
X-Rspamd-Action: no action

On Fri, 2026-04-24 at 00:30 +0530, karthikeyan K S wrote:
> From c50ff07baf2032ca12133775c61c50a38e8a2029 Mon Sep 17 00:00:00 2001
> From: Karthikeyan KS <karthiproffesional@gmail.com>
> Date: Thu, 23 Apr 2026 21:26:08 +0300
> Subject: [PATCH] soc: aspeed: lpc-snoop: Fix usercopy overflow in
> =C2=A0snoop_file_read
>=20
> snoop_file_read() passes the userspace count directly to
> kfifo_to_user() without clamping. The kfifo backing buffer is
> 2048 bytes (SNOOP_FIFO_SIZE), allocated from kmalloc-2k slab.
> A read larger than 2048 bytes triggers a BUG under
> CONFIG_HARDENED_USERCOPY:
>=20
> =C2=A0 kernel BUG at mm/usercopy.c:99!
>=20
> Reproducer:
> =C2=A0 hexdump /dev/aspeed-lpc-snoop0

Can you provide more details on how you achieved this result?
__kfifo_to_user() clamps the provided value to the content of the fifo
and has done in its current form since 2e956fb32056 ("kfifo: replace
the old non generic API").

>=20
> Fix by clamping count to SNOOP_FIFO_SIZE before the copy.
>=20
> Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc
> chardev")
> Cc: stable@vger.kernel.org
> Signed-off-by: Karthikeyan KS <karthiproffesional@gmail.com>
> ---
> =C2=A0drivers/soc/aspeed/aspeed-lpc-snoop.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index b03310c0830d..5b59e826cc68 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -125,6 +125,7 @@ static ssize_t snoop_file_read(struct file *file, cha=
r
> __user *buffer,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret =3D=3D -ERESTARTSYS)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=
 -EINTR;
> =C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0 count =3D min(count, (size_t)SNOOP_FIFO_SIZE);
> =C2=A0=C2=A0=C2=A0 ret =3D kfifo_to_user(&chan->fifo, buffer, count, &cop=
ied);
> =C2=A0=C2=A0=C2=A0 if (ret)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;

