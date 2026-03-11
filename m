Return-Path: <linux-aspeed+bounces-3645-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHRwL+lhsWl/uQIAu9opvQ
	(envelope-from <linux-aspeed+bounces-3645-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Mar 2026 13:36:57 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49177263ABB
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Mar 2026 13:36:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fW9H94nC0z3cBd;
	Wed, 11 Mar 2026 23:36:53 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773232613;
	cv=none; b=Vh1ays+mSU/UFTMx6S4VUqJAih2YMba9IW3utabGLJDLEMcbNTa9J0pwJCotUI+5J26G/wkmCnPD8gsBVCci4iwGqju+ZJaD6mH32T3iJkx5pkE712GuS+bYDfAWZSb9kk7FY9tv/cc/+jzHKDmSwpmMa36K9hT4Ub/PBCd+02Hizx8bgthSXxVnZC2SCeKdR+2h2foxd9BsP7HYfjT5e/7dRYz06CMANQFlybqqn0ll6GCRmvq8FX6z9O0MJ2uBEKP3eKkXNeeC2oDVhDRN2N79u0ncT5WqbjA7xHzq8DtgKo/DXxqkDQ2nbauSvodrgSHGq0wHbN/sOabCd0HPtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773232613; c=relaxed/relaxed;
	bh=cYNLKIwQSasBdYZGFqUzejhZnpcUdrBH4ZJakw/Cw+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AACjYw1+RQCPiDcZXfILeXu2EdRyJOvwx1iI4nW6W7jGfHqzdHSTtHlrwiBUDbR6IfPmdAzC81gvHU1wdeCR97dRDtb/uZsTAc9G2JimLH2xNUotIdVxdYEMVfLX7EL+EecVwzE/rFHvIzLEKY6MW4yZkrW7qa6PcI9tWdxKqISyA18YYGwIk9SWuO2/EL1Gxv7pX9ora7ioV3Lv+48ZUHJlENi88sWG9JY3GV35fgDZIpJK12+ABtS7ipxUJ/pXYYlcFvfq+AjHmXSmKSXZyckrWtSl4HbuCsCBNqlYFfUvQAf7BGwfJNHmNM+XygXylJ1wAZBciwkzF2oPaA39DQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=RHOIw8K0; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=RHOIw8K0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fW9H73QT8z3cBW
	for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Mar 2026 23:36:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=cYNLKIwQSasBdYZGFqUzejhZnpcUdrBH4ZJakw/Cw+8=; b=RH
	OIw8K0qHvCBbrvpteh+VT0BrYx/46g/NdI8GvvNAp31wBun/NJpCAvqnEdPQ9fs+QIFmMO6qK6Cwn
	g/+RhTu31W0S6gMZ99WhvWo+oEVArBxTPDaJ9R96CHAUvB8ggbzTCEkB8VzHD0LPiaMMC+7F0oziM
	UutcfMNomj8D0Oo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w0Inf-00BB9I-F9; Wed, 11 Mar 2026 13:36:31 +0100
Date: Wed, 11 Mar 2026 13:36:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Patrick Williams <patrick@stwcx.xyz>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>,
	Roger Kan <Roger.Kan@quantatw.com>
Subject: Re: [PATCH v2 0/2] Add Meta (Facebook) SanMiguel BMC (AST2620)
Message-ID: <8249f102-cc35-4614-9e20-506c51a78d8e@lunn.ch>
References: <20260203-sanmiguel_init_dts-v2-0-6a5682c32b38@gmail.com>
 <3256b313-7671-4fda-9949-766906c344a7@lunn.ch>
 <CAGfYmwUfKk5OrFzJRHyu6h-Jf-cqbxfh62wRmxwOL8K7VfFGfg@mail.gmail.com>
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
In-Reply-To: <CAGfYmwUfKk5OrFzJRHyu6h-Jf-cqbxfh62wRmxwOL8K7VfFGfg@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 49177263ABB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3645-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:potin.lai.pt@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:patrick@stwcx.xyz,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:cosmo.chou@quantatw.com,m:Mike_Hsieh@quantatw.com,m:potin.lai@quantatw.com,m:Roger.Kan@quantatw.com,m:potinlaipt@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 02:31:48PM +0800, Potin Lai wrote:
> On Tue, Feb 3, 2026 at 9:42 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Tue, Feb 03, 2026 at 05:48:13PM +0800, Potin Lai wrote:
> > > Add Linux device tree entries for Meta (Facebook) SanMiguel specific
> > > devices connected to the AST2620 BMC SoC.
> > >
> > > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> > > ---
> > > Changes in v2:
> > > - change mac0 phy-mode to rgmii-id
> >
> > No other change? Was the previous version broken, and never tested? Is
> > this version broken and not tested? Is the phy-mode ignored, which
> > suggests something else is broken?
> >
> >      Andrew
> 
> Hi Andrew,
> 
> Sorry for the late reply.
> Both "rgmii-id" and "rgmii-rxid" modes work fine without connection issues.
> However, based on the scan testing we performed in U-Boot, "rgmii-id"
> shows better coverage than "rgmii-rxid". Therefore, we decided to
> switch to "rgmii-id".

I'm surprised it works with both, that is well outside the RGMII
specification. The PHY must be pretty forgiving.

Anyway, thanks for the information.

	Andrew

