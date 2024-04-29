Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 263A68B524D
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2024 09:26:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=yXFdsJkT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSZcm5YXZz3cTl
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2024 17:26:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=yXFdsJkT;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSZcf18X6z3cPW;
	Mon, 29 Apr 2024 17:25:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1714375551;
	bh=aMtf7sZWIA9NYNNihpVIGT39sRqE803C8mH+SyphSB8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=yXFdsJkT9LJI8bThh90WPxZlWBrz9GKubk0ihS2aJ9s4L8/wwezpS1dHPjlRRtCg/
	 1RZibvf+2C2XAXmSD4idjwtDXiI4v3hVa76I0wHWWghU4wr+5Us66hdPm6nf8/u8gI
	 rW4pnnpFjQGGRDPZYRjgjxWQ8k6G1B+OdFex8jJNaULTD/xT2nqzgbKLJutPR2tAz/
	 qcwIRr8YuG03+0G4+PBxvxRAaxTwU9ayl+s+fgnTIKAJv3CewwasmaCzXpZ8wyYcP3
	 GWXiXerOoIzDiz04Q0Gy9eZr03SEg9TuGFZAQi0jJUXhY3FZtsSBU/vKDIq61T2uhU
	 NSASg6tm7bYNg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VSZcZ212dz4wck;
	Mon, 29 Apr 2024 17:25:50 +1000 (AEST)
Message-ID: <d516da3ccaff1c6653a1978d714941542eb4af73.camel@ozlabs.org>
Subject: Re: [PATCH 0/4] fsi: Convert to platform remove callback returning
 void
From: Jeremy Kerr <jk@ozlabs.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
	Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2024 15:25:48 +0800
In-Reply-To: <c62jfobjeuvjopxt4mdcgpp2eawesp6il2iz3izc3azvutzfxl@ztzhkw6eyd4o>
References: <cover.1709673414.git.u.kleine-koenig@pengutronix.de>
	 <pd2qn2zqhdd4hv2vn6g3p6kzcer343f6xm75tcj2xi5qgk7h5l@uv6uaa7zj7mu>
	 <c62jfobjeuvjopxt4mdcgpp2eawesp6il2iz3izc3azvutzfxl@ztzhkw6eyd4o>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: linux-aspeed@lists.ozlabs.org, Alistar Popple <alistair@popple.id.au>, kernel@pengutronix.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Uwe,

> I intend to change platform_driver::remove soon after the next merge
> window to let it cook in next for a while. If this patch set doesn't
> make it in before, I'll send it together with the patch changing
> platform_driver::remove to Greg.


Joel is somewhat-off at present, and the FSI changes typically go
through Greg anyway, so this all sounds fine to me.

In case it helps:

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy
