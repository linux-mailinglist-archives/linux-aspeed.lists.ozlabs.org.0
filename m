Return-Path: <linux-aspeed+bounces-142-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316B09D270A
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Nov 2024 14:36:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xt59T6TfLz2xvR;
	Wed, 20 Nov 2024 00:35:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732023357;
	cv=none; b=cR/SY5+sejEqksjmlQtT7tu0hT6wuyl5A2WXXqj/bDBrXtqnEkeiy0Y+kA7YJuq87Tyob8YR2C9xcGO6ZBmPp8i3rlWZb2wTe0XEfi86wD+fsoHIEQf1UixtJ0qTUszXSPuTFqOaaavZZMK4tDByrkfjqOcZW99OZpb0VZuRvGwj7trJcx2cFYqAgTcdPDeoDkskCN8PDhr7lowGod56pFifrc+a+l3X3A7a6DvNOTSTfGtLzF7xqWzbX4tz09/fCGvpNC2XQmwr6VBszBhwghkUSXRuOu8JM6YRP3yPJVgbA8RR1TK+zRu3Tf8+BNL0hfQ5adhV1Is7mXdojNg6Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732023357; c=relaxed/relaxed;
	bh=Wjea4FlwXiv3hwGbFMl+5M469Qx4kTcDewT9eAG6hxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+spxDQ/ucO3Kma6HxnqYyrrbTgw2PHL3V0shvydTHILa4b9y/KyY4WfzMB5PZLak2V4G4YmygpSPdg4igws0JLAM7AVIOR7iQlx6bU6+j8v+3Wia8HksLgZGxs6ORrXl6ntpPz8zlKlD35hnWqmu1WoqhZkVip7+aPvWTdPVhH8RkwD/WeK7UxVE1819CgpsC89edwTMeGghMfnVoQ6u2n4wGUpfczl1GD1VFenx62Xi8QYlNDLx2ilmAy/N+n8Ix3UOZ1GIQJB5Tl8TquY6i5U25PMeNzeom81Z/43kQBhjkCgX/1Kks+IDRnBJPvsqZjofQqH8q/e6BvQnMQg5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AebHnbAQ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AebHnbAQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xt59S6344z2xsM;
	Wed, 20 Nov 2024 00:35:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4E24CA42A33;
	Tue, 19 Nov 2024 13:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392E8C4CECF;
	Tue, 19 Nov 2024 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732023351;
	bh=oLpoc2WvoUsUhrS1aPvboIlqwN760aHoq0UZupZxYjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AebHnbAQkG2N53GlUQn1JKbPsQYgSuLJ3rIaWjBB1+Cz/TCXT/sTExaoTfk1RdkaX
	 qptk0tFf5g5zglEsN0RoWn1letpAIHLW/3okldSWHABXmTBHP4uUm/XkvCfqliWsbM
	 cVFTfMGunVzFG9oVsnGg7/hkneH5HGDpv1hq0GnfFZLJI8yzx/D75zVTUivGmlX4/H
	 gM3kIpPHrPmhAVlpdxt6jPUvkVHzBSi1uCac2FIAyEG9N/HqkD9of+N7nf1Kaec2o+
	 TZskTdPA3hLcTCm2WHYwZ1cNLKRDgNEI0qVNVgW2Yd9BUV32McmtVAZlv262Nx8X4R
	 8GZ/c0vgqwXyA==
Date: Tue, 19 Nov 2024 14:35:48 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Brendan Higgins <brendanhiggins@google.com>, Tommy Huang <tommy_huang@aspeedtech.com>, 
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, "wsa@kernel.org" <wsa@kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	BMC-SW <BMC-SW@aspeedtech.com>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>
Subject: Re: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from
 Brendan to Ryan
Message-ID: <x2rt6k5hw2km2vm4wjnqihop3xcy3uirhxs5wvhnesxc2athgb@c2ra7a62mfve>
References: <20241115044303.50877-1-brendanhiggins@google.com>
 <ZzcPJ9sweqxLZOGf@ninjato>
 <OS8PR06MB75413EC87F76AD0B1BBA0FEFF2272@OS8PR06MB7541.apcprd06.prod.outlook.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB75413EC87F76AD0B1BBA0FEFF2272@OS8PR06MB7541.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Ryan,

On Mon, Nov 18, 2024 at 12:25:56AM +0000, Ryan Chen wrote:
> > Subject: Re: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from
> > Brendan to Ryan
> > 
> > On Fri, Nov 15, 2024 at 04:43:03AM +0000, Brendan Higgins wrote:
> > > Remove Brendan Higgins <brendanhiggins@google.com> from i2c-aspeed
> > > entry and replace with Ryan Chen <ryan_chen@aspeedtech.com>.
> > >
> > > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > > ---
> > > I am leaving Google and am going through and cleaning up my
> > > @google.com
> > 
> > Thanks for your work on this driver.
> > 
> > > address in the relevant places. I was just going to remove myself from
> > > the ASPEED I2C DRIVER since I haven't been paying attention to it, but
> > > then I saw Ryan is adding a file for the I2C functions on 2600, which
> > > made my think: Should I replace myself with Ryan as the maintainer?
> > >
> > > I see that I am the only person actually listed as the maintainer at
> > > the moment, and I don't want to leave this in an unmaintained state.
> > > What does everyone think? Are we cool with Ryan as the new maintainer?
> > 
> > I am fine, depends on Ryan as far as I am concerned.
> Thanks a lot, Brendan.
> I am ok to be a maintainer.

can I take this as an a-b by you?

Andi

