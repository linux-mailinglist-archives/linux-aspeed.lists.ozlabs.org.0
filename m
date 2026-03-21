Return-Path: <linux-aspeed+bounces-3733-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMeYHpG+vmmFZwMAu9opvQ
	(envelope-from <linux-aspeed+bounces-3733-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sat, 21 Mar 2026 16:51:45 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7EA2E638C
	for <lists+linux-aspeed@lfdr.de>; Sat, 21 Mar 2026 16:51:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fdP7J6Hcsz2yfs;
	Sun, 22 Mar 2026 02:51:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774108300;
	cv=none; b=QKVT/AyK4wOGQvSwyPvgZVlEgT8GWAMLkjIPf78HZ5tBmYizfTaLrat0Ex2ZL/nufstFSuVmHXcGb2gc9gKJYNfKXK26ZWwUwgyXjFSqgifp6QDE92yTIzLexlzAhbcjP4vxI0SP/rFzMw79Y51ZXkKE7lz0TwcSk70G2hnsp5SW9TNIaKOdO50bM4JtkjfDiGUZNpfvwNAPPQ0APK67HjDzLvyz5WKMG7lq2Arl3F6HSJtAE8jLkYNYhqcQmJ1SWPiLElLN7lgpLX0AFRZfFu6bgUHigblrpqqRlTnq0Dj9FS5h+EJ+YqgqFh9vZGuPzpi/PnFuIMn0Ga4UOQNxRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774108300; c=relaxed/relaxed;
	bh=sG4XhuqDJEdIQMND5WpkEc5bLbq0ERYW/OUxAG8RzSw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HvudB9po0lrOv9oCJRSjpHybMutFKzKiAn1lBOGFfYtHYxj/TdA+zuDWrF9f3IfZzyXiGvU0RPyu1PQSDZta6wW7UbDT9052vGQPJzoE3m5TwbUhHow5ozLAiRlRc54Nje+3h5/V9j4vu4YABk15nuWIjJ4BCs5tfAywln/Sg5LxUJauDlRI2TU1lur40443px/oBgNYN1lg46SzfPt00N6uGtf2x/WEwklvVNrDU4/0VX2k43VeDyPbPAy1hj8AuE1n5yV+SSqjedGEwwHkAuDWxS6m6PwvuLZPYIMiZV2g8vZ2AMzQKO1PKjp0tgA6W7DFoUDEptnZtVOz+fDw8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S615ZWhJ; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S615ZWhJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fdP7J1rL5z2yfl
	for <linux-aspeed@lists.ozlabs.org>; Sun, 22 Mar 2026 02:51:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F1EA60097;
	Sat, 21 Mar 2026 15:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C045C19421;
	Sat, 21 Mar 2026 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774108297;
	bh=iJK6gXRLy8snWp9xWdLSHDh/M81apV4w9OBDnP6so3c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S615ZWhJmxbdpU+bgacRtU8dgRb16UnPmsyiRB3L6XZW+D+RcW/f/dzvmE92oVsXX
	 do7A2ayfRyx3Gx2wPKf31th8IWvMlFRWxVAhgzm8t2cYvWYEg1Pe5kQZVY3Sfd4Iuq
	 9fwlxfE9ycpiUsNH2c4xej/TemgNxyF+fctZdo35/e8YaGAbKOCobDHUymeNrfykPc
	 SJ5ZD23GsrUVCNhXe7K1tVkg7HrXSmETfmXQWi1eTU/ZLBxoSLPYxPjQH5iAZjT/JC
	 mAHEQOoLvWi07QJYHamGlARrG2vRz6P0MP6FVjMLXL68o8a+fiJGHB3t7n5nChdg4o
	 6RHej1iQmb4dg==
Date: Sat, 21 Mar 2026 15:51:27 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, morris_mao@aspeedtech.com
Subject: Re: [PATCH v3 4/4] iio: adc: aspeed: Reserve battery sensing
 channel for on-demand use
Message-ID: <20260321155127.3e63fa47@jic23-huawei>
In-Reply-To: <ab0ifBMNuY4BwqA5@ashevche-desk.local>
References: <20260320-adc-v3-0-bc0eac04ef7c@aspeedtech.com>
	<20260320-adc-v3-4-bc0eac04ef7c@aspeedtech.com>
	<ab0ifBMNuY4BwqA5@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-pc-linux-gnu)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:billy_tsai@aspeedtech.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-iio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:morris_mao@aspeedtech.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3733-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Rspamd-Queue-Id: 9D7EA2E638C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 20 Mar 2026 12:33:32 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Fri, Mar 20, 2026 at 01:46:38PM +0800, Billy Tsai wrote:
> > For controllers with battery sensing capability (AST2600/AST2700), the
> > last channel uses a different circuit design optimized for battery
> > voltage measurement. This channel should not be enabled by default
> > along with other channels to avoid potential interference and power
> > efficiency issues.
> > This ensures optimal power efficiency for normal ADC operations while
> > maintaining full functionality when battery sensing is needed.  
> 
> 
> ...
> 
> > +			/*
> > +			 * After enable a new channel need to wait some time for ADC stable  
> 
> Missed period at the end. And you probably wanted to say
> "...for ADC to stabilize."
Tweaked and tidied up line wrap.

Series applied to the togreg branch of iio.git.

thanks,

Jonathan

> 
> > +			 * Experiment result is 1ms.
> > +			 */
> > +			fsleep(1000);
> > +		}  
> 


