Return-Path: <linux-aspeed+bounces-3908-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FCdIf8M4GmzcAAAu9opvQ
	(envelope-from <linux-aspeed+bounces-3908-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Apr 2026 00:11:11 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBD0408746
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Apr 2026 00:11:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fwwMX3XZNz2xlK;
	Thu, 16 Apr 2026 08:11:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776291064;
	cv=none; b=ekJx3HL0n7YJU+cDWvhQomLb0JJy/sW+pZgFnOzTZCt07jxo5BesqhSbMoE9QMwsBfvyHgmjOs+wSEnvO7w6wiDZBRrHo381pV2Mkx4CdU7wwEJx4o1cj8euh5gNNORkSGew0VifyeawAkQP6oCZaEpGKQHVNGHdwEfd25bcvjrv4RFORVFPTaWN2tsj/mPpnQhKNSXuJnFYXddBlrriKp2GYY8eVsMIsPslACa4mYOIGwjLG2DrG6kJY5IQhdz4XOrufE6MIre5IbtJX/MRVkZ3oiHmqp4xN49sIcZI/vrLDj0UXfbEM9JNYWvdal+3k8PwVzYxR8I/ylSYdo4+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776291064; c=relaxed/relaxed;
	bh=BZdrZIkOSqbzGAWUiUFdmBRnxHfqO64E/VC6vDSmexI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Om/5mtS4rIFmObUXdfqo0rNw4tNf4cBiTo46XjQW1WfJTJC4AmavCrfW+OVIlpfDveor8UgPryqeNTGUFGkuPz9T9GTITe+Ik8BDk8xp+aqf12I9hwRCh9jlXDX1OKu6v7Dv5Uql44tWKqgDOVfiGm4lAcUpMdGuDTydI5G6eQyjnx0bi+Ju3brOq3mBfzOI7LPkuN3GUGYbsvzS56JxXMRTybNVqtmLOs9KZSUFsvUWd4NgqxRzh1pZFjwqNm1tfHILB5LlfXw41YFF/44XBRVAT8mNwZuAkfmolP5s/CfSkMmlOKKJak11Bov0I5n7Nw2hjsIVltg9teUrYgIbfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p0G82jNv; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p0G82jNv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fwwMW2NPvz2xc8
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Apr 2026 08:11:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33D90415F6;
	Wed, 15 Apr 2026 22:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9759C2BCB3;
	Wed, 15 Apr 2026 22:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776291061;
	bh=4MjkOgWu+H/4IbKFLTcEqaA80AYv/7LFnNzAZ1Q9/eY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p0G82jNvv+WdUrzCg0FXEUgFE67KoF8lsRoHLR1Eixg/LXzBOmBt72ny96ygZ1Yh7
	 5pjtAjRmscQPZ3vzTHEJVK2X3F5iY9VBGqR24yPawyJQ/gAIlyZBVqDlxU6RxtLQOu
	 GIOuEzZ4IIVyp1JVp1Bd0caHsANeP3Y9FjSY0dKokZFCp73u2B9/2SZh9VaeNP9dKw
	 bDqy1aSrrHxSChU/DDEkPqQ/9mXmyBZFULTx7CeyP1LoiLkGahr6y7zWTmj5JAf+iF
	 LSKM2823g0Z3h0jTPv9V+xvD6mu4GBgiebxCOKq/m8zV5ubcEy7dHDB71HDaXfInaG
	 zk3lxaVX52GYQ==
Date: Wed, 15 Apr 2026 17:10:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: astewart@tektelic.com, linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>, bhelgaas@google.com,
	maz@kernel.org, linux@armlinux.org.uk, kees@kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Saravana Kannan <saravanak@kernel.org>, netdev@vger.kernel.org,
	linux-serial@vger.kernel.org, davem@davemloft.net, andrew@lunn.ch,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, brgl@kernel.org,
	jirislaby@kernel.org, mani@kernel.org,
	Johan Hovold <johan@kernel.org>, linux-aspeed@lists.ozlabs.org,
	linux-pci@vger.kernel.org, kuba@kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	andriy.shevchenko@linux.intel.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Alexey Kardashevskiy <aik@ozlabs.ru>, lgirdwood@gmail.com,
	andrew@codeconstruct.com.au, hkallweit1@gmail.com,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Eric Dumazet <edumazet@google.com>, linux-usb@vger.kernel.org,
	alexander.stein@ew.tq-group.com,
	Robin Murphy <robin.murphy@arm.com>, pabeni@redhat.com,
	devicetree@vger.kernel.org, driver-core@lists.linux.dev,
	joel@jms.id.au, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v5 8/9] driver core: Replace dev->of_node_reused with
 dev_of_node_reused()
Message-ID: <177629105858.764226.5689083905556313606.robh@kernel.org>
References: <20260406232444.3117516-1-dianders@chromium.org>
 <20260406162231.v5.8.I806b8636cd3724f6cd1f5e199318ab8694472d90@changeid>
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
In-Reply-To: <20260406162231.v5.8.I806b8636cd3724f6cd1f5e199318ab8694472d90@changeid>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[tektelic.com,lists.infradead.org,kernel.org,google.com,armlinux.org.uk,rowland.harvard.edu,vger.kernel.org,davemloft.net,lunn.ch,linuxfoundation.org,lists.ozlabs.org,intel.com,linux.intel.com,ozlabs.ru,gmail.com,codeconstruct.com.au,ew.tq-group.com,arm.com,redhat.com,lists.linux.dev,jms.id.au,lst.de];
	TAGGED_FROM(0.00)[bounces-3908-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dianders@chromium.org,m:astewart@tektelic.com,m:linux-arm-kernel@lists.infradead.org,m:broonie@kernel.org,m:bhelgaas@google.com,m:maz@kernel.org,m:linux@armlinux.org.uk,m:kees@kernel.org,m:stern@rowland.harvard.edu,m:saravanak@kernel.org,m:netdev@vger.kernel.org,m:linux-serial@vger.kernel.org,m:davem@davemloft.net,m:andrew@lunn.ch,m:gregkh@linuxfoundation.org,m:brgl@kernel.org,m:jirislaby@kernel.org,m:mani@kernel.org,m:johan@kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:kuba@kernel.org,m:aleksander.lobakin@intel.com,m:leon@kernel.org,m:andriy.shevchenko@linux.intel.com,m:rafael@kernel.org,m:aik@ozlabs.ru,m:lgirdwood@gmail.com,m:andrew@codeconstruct.com.au,m:hkallweit1@gmail.com,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,m:edumazet@google.com,m:linux-usb@vger.kernel.org,m:alexander.stein@ew.tq-group.com,m:robin.murphy@arm.com,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:driver-core@lists.linux.dev,m:joel@jms.id.au,m:hch
 @lst.de,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email]
X-Rspamd-Queue-Id: CDBD0408746
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 06 Apr 2026 16:23:01 -0700, Douglas Anderson wrote:
> In C, bitfields are not necessarily safe to modify from multiple
> threads without locking. Switch "of_node_reused" over to the "flags"
> field so modifications are safe.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Not fixing any known bugs; problem is theoretical and found by code
> inspection. Change is done somewhat manually and only lightly tested
> (mostly compile-time tested).
> 
> (no changes since v4)
> 
> Changes in v4:
> - Use accessor functions for flags
> 
> Changes in v3:
> - New
> 
>  drivers/base/core.c                      | 2 +-
>  drivers/base/pinctrl.c                   | 2 +-
>  drivers/base/platform.c                  | 2 +-
>  drivers/net/pcs/pcs-xpcs-plat.c          | 2 +-
>  drivers/of/device.c                      | 6 +++---
>  drivers/pci/of.c                         | 2 +-
>  drivers/pci/pwrctrl/core.c               | 2 +-
>  drivers/regulator/bq257xx-regulator.c    | 2 +-
>  drivers/regulator/rk808-regulator.c      | 2 +-
>  drivers/tty/serial/serial_base_bus.c     | 2 +-
>  drivers/usb/gadget/udc/aspeed-vhub/dev.c | 2 +-
>  include/linux/device.h                   | 7 ++++---
>  12 files changed, 17 insertions(+), 16 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


