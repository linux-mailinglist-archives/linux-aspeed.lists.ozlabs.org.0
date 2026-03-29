Return-Path: <linux-aspeed+bounces-3796-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP8AOpuayGmOnwUAu9opvQ
	(envelope-from <linux-aspeed+bounces-3796-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 Mar 2026 05:20:59 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A08EA350903
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 Mar 2026 05:20:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fk05J6mQZz2yft;
	Sun, 29 Mar 2026 14:20:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774754452;
	cv=none; b=jRlATTVfsaKWsBjtVqxwwYOdEn8GxOYt2GCeMnz5afELPqrHcPy8zUzFYdpQAX9HbzSRC2E9RKXXgJ/JtzABgDljH008tletxckMFE8FYuGJY7xwzmG8A8BpKWrmvOTO+izDYUHCTv5dCAH5wqTFQg0/YzXH4MtcaYiDH7JqE+wc2gHUVKI+nB1dAofc+jq/ARdXP3LmvalPdmU8ltCmsJtw/O/oIQjDJspglVN4GcVa1WNumTFFx/YXJz0CWoXBj/Dt7TNtM2N6JtyDCCeC5w+L4ZMHlr7vT2Vo3frULoK06koc5mJ46s/inE+qza5lFkN01RnL9KcDg7CWxT7/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774754452; c=relaxed/relaxed;
	bh=gUuZHrDWxaaWF4+/n4z56tn8qK+LyT2Zab514kfOXec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxdzOyEM8ZAv3ygcLLkqMYEZFAjf4ze2IJ39vpGdKtmH5oq+eiFyRnqB9d+VwKgmEdhjZOq1Z8CO7XHRwVo33+muHLAdAkU/+DpCD/AcrxhzNBHdSBnK+xmJ6gbd2Bfy/s6WmCGKiD+GibqpKbJPO2nfyDltW7/1Zm0cQNJE7dJWOtWqf48+qE+OugTtlR04LBJJXCJ9S7ZG0+QOQkEken9iSsp6kfXP6i4wopYPN1qbYS44bqmBxfQ330YoOL20uL6QQSIoGG6JUUbwq0erb2F4L5OSY6rP6c7p/xhREcYmIltBuyDa5GhzmxkE0RQmDzvng97kCnUpgRO4kiccVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=1Rwsmr+7; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=1Rwsmr+7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fk05H441Pz2xl0
	for <linux-aspeed@lists.ozlabs.org>; Sun, 29 Mar 2026 14:20:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=gUuZHrDWxaaWF4+/n4z56tn8qK+LyT2Zab514kfOXec=; b=1R
	wsmr+7CebtxmeC7zSCRBXBzSP8TtlMe1LeiLLkDCkbO6f1YWfIH9XlyyRJk9qfQmjPkiqnYrcJbYX
	fMvITKt05bjHr+c22rl8xd158RD+PJo097oMNQod4FzDa4iVhmf15I0Syp5CHamydP7ETNHRJKNb2
	A4sxszRKx5ltQz4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w6ghV-00Dr5E-2n; Sun, 29 Mar 2026 05:20:33 +0200
Date: Sun, 29 Mar 2026 05:20:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed: Enable networking for Asus Kommando
 IPMI Card
Message-ID: <b8e4da26-ae8e-4b2d-b259-c13e3a4d0aa0@lunn.ch>
References: <20260328-asus-kommando-networking-v1-1-66d308b88536@gmail.com>
 <ed3d39df-0a0e-427b-86cf-b9b2d2094b51@lunn.ch>
 <CAJ13v3S7ucjd-ifmKFBDGtsg32MbOar2OBeiGMVEJBsH8+JP7Q@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ13v3S7ucjd-ifmKFBDGtsg32MbOar2OBeiGMVEJBsH8+JP7Q@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3796-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anirudhsriniv@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A08EA350903
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 07:14:04PM -0500, Anirudh Srinivasan wrote:
> Hi Andrew
> 
> On Sat, Mar 28, 2026 at 7:05 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Sat, Mar 28, 2026 at 06:39:59PM -0500, Anirudh Srinivasan wrote:
> > > Adds the DT nodes needed for ethernet support for Asus Kommando, with
> > > phy mode set to rgmii-id.
> > >
> > > When this DT was originally added, the phy mode was set to rgmii (which
> > > was incorrect). It was suggested to remove networking support from the
> > > DT till the Aspeed networking driver was patched so that the correct phy
> > > mode could be used.
> > >
> > > The discussion in [1] mentions that u-boot was inserting clk delays that
> > > weren't needed, which resulted in needing to set the phy mode in linux
> > > to rgmii incorrectly. The solution suggested there was to patch u-boot to
> > > no longer insert these clk delays and use rgmii-id as the phy mode for
> > > any future DTs added to linux.
> > >
> > > This DT was tested with a u-boot DT modified to insert clk delays of 0
> > > (instead of patching u-boot itself). [2] adds a u-boot DT for this
> > > device (without networking) and describes how to patch it to add
> > > networking support. If this patched DT is used, then networking works
> > > with rgmii-id phy mode in both u-boot and linux.
> >
> > I've been looking at
> >
> > https://elixir.bootlin.com/u-boot/v2026.04-rc5/source/drivers/clk/aspeed/clk_ast2600.c
> >
> > And i don't see where mac2-clk-delay is implemented. Could you point
> > out the code?
> 
> I'm testing against the u-boot version that openbmc uses for its
> builds. I don't think upstream u-boot is used by openbmc.
> 
> https://github.com/openbmc/u-boot/blob/v2019.04-aspeed-openbmc/drivers/clk/aspeed/clk_ast2600.c#L999

Please include in the commit message that you need to use a fork of
u-boot.

	Andrew

