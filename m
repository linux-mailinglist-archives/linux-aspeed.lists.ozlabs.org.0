Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CA2915AC7
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 01:55:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Hzzi/f/m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7Pwp10lRz3cgd
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 09:55:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Hzzi/f/m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7Pwh1zy1z3cSd
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 09:55:31 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5774020009;
	Tue, 25 Jun 2024 07:55:26 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719273328;
	bh=LM1Doa73WH2U5GZd0XjIfitH1ryNkqLvgCDsiw2vTHE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Hzzi/f/mEXrNfUseAUuK3uJNbCFk1jPN4G5K+/b1ByhbFtLgWrdIqX56+oPlOK04c
	 eLFLQWAHYNOAT7nXQ/sovVxWV9T6eqp1pC6kVGPnKCIqAaRfz41SIrD0J/eA2dF+KO
	 1BswyJu2QIA2ZqYmIUoG8bSN/tCf5vmBapc3BaqhUCkqscXf5/TIqt5BoPizgnlnSd
	 De2Aug2lRZHaIPAEhZ5P7q6GLebTDND68ieLv0pDNLxtHCUgkYDKtaNPF/VGDS0PqB
	 48qviuDObLOP+4FSUAx1crCDpF9zHcyDKavCif+xquHeoT6u+FrdRvCCXRXRUK8hW7
	 l8H0HfmVbA4pA==
Message-ID: <acf7873c4bd9ce1352d54fc479d5d387338929e9.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] usb: gadget: aspeed_udc: validate endpoint index for
 ast udc
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ma Ke <make24@iscas.ac.cn>, neal_liu@aspeedtech.com, 
	gregkh@linuxfoundation.org, joel@jms.id.au
Date: Tue, 25 Jun 2024 09:25:24 +0930
In-Reply-To: <20240624015314.2249128-1-make24@iscas.ac.cn>
References: <20240624015314.2249128-1-make24@iscas.ac.cn>
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
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2024-06-24 at 09:53 +0800, Ma Ke wrote:
> We should verify the bound of the array to assure that host
> may not manipulate the index to point past endpoint array.
>=20
> Found by static analysis.
>=20
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Probably best to do a v3 with a changelog as Greg's email suggests (and
for the v3 changelog entry, mention that you added the changelog).

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

