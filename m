Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AFF8FDBFF
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 03:02:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=a6QwG1+J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvmJy2Cx8z3cVB
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 11:02:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=a6QwG1+J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvmJr1hysz30WJ
	for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Jun 2024 11:02:35 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DFF912019A;
	Thu,  6 Jun 2024 09:02:27 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717635749;
	bh=vAl16jhOUnZ9tQ3HTNy0q9zgou8JX+J4uJEX70eQQas=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=a6QwG1+JD5X90B1bRqaQhBMYgVxuOYlUaBMIjoYYWSPS5D4IZQN6DjSP9+3vAjzUz
	 yAP1yUqBY54UzuuOcyD/24+vIXwxyjUb2XUtbpjWwpJ2SHiwfSpwwXvXKUCPxNRGyH
	 0EQZnh9l5jVEL4Rk4U2HPM5mNcgJjMMd71H9Twv/IzvACFgEv6UtGxX8SaLtjYyLgd
	 pXI4Rys+iRa6mdmfJi0qWbCSRBj5szMT5CqY96xLM+MWad05Glwla5dB4xvH4NFJjv
	 O+jbmKtBIU9bzgU02VuAmoNaeLFlM+FWpjWMz1+nMOzQ7GFye9T2pe54RnGrrygo90
	 glzBWJ90n8Iig==
Message-ID: <21490f28ab110ae2eca59ec23591fc9c676361cc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 00/40] fsi: Add interrupt support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Date: Thu, 06 Jun 2024 10:32:27 +0930
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
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
Cc: andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, jk@ozlabs.org, alistair@popple.id.au, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, lakshmiy@us.ibm.com, linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-06-05 at 16:22 -0500, Eddie James wrote:
> Eddie James (40):

...

>=20
>  .../dts/aspeed/aspeed-bmc-ibm-everest.dts     |  32 +-
>  .../boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts |   1 +
>  .../arm/boot/dts/aspeed/ibm-power10-dual.dtsi |  17 +-
>  .../arm/boot/dts/aspeed/ibm-power10-quad.dtsi |  16 +-
>  drivers/fsi/Kconfig                           |   2 +
>  drivers/fsi/fsi-core.c                        | 888 +++++++++++++++---
>  drivers/fsi/fsi-master-aspeed.c               | 431 +++++----
>  drivers/fsi/fsi-master-hub.c                  | 244 ++---
>  drivers/fsi/fsi-master-i2cr.c                 |   2 +-
>  drivers/fsi/fsi-master.h                      |  33 +
>  drivers/fsi/fsi-slave.h                       | 117 +++
>  drivers/i2c/busses/i2c-fsi.c                  | 463 ++++++---
>  drivers/spi/spi-fsi.c                         |  33 +-
>  include/linux/fsi.h                           |   3 +
>  include/trace/events/fsi.h                    | 171 ++--
>  include/trace/events/fsi_master_aspeed.h      |  86 +-
>  include/trace/events/i2c_fsi.h                |  45 +
>  17 files changed, 1897 insertions(+), 687 deletions(-)
>  create mode 100644 include/trace/events/i2c_fsi.h


That's a lot of patches, that span the trees of several maintainers.

What's your expectation for those who should be merging work in this
combined series? Have you had any feedback in that regard?

I'm asking because I need to make a call on what I do with respect to
the Aspeed devicetrees. I think it would clarify responsibility if this
series were split by subsystem. That way I can apply the devicetree
patches and the rest can go through their respective trees.

If there are dependencies that require merging all or none, then it
would be helpful if they were outlined in the cover letter. Even then,
merging the leaves and waiting a cycle might make everyone's lives
easier?

Andrew
