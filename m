Return-Path: <linux-aspeed+bounces-3851-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCTCFkDJ1Gk0xgcAu9opvQ
	(envelope-from <linux-aspeed+bounces-3851-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 07 Apr 2026 11:07:12 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C8E3ABBE3
	for <lists+linux-aspeed@lfdr.de>; Tue, 07 Apr 2026 11:07:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fqgLh0Xj8z2yhD;
	Tue, 07 Apr 2026 19:07:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775552827;
	cv=none; b=Nvkgl/T6KdsqqcOUC2766INsdeghTKLD+RIJyMX1TvhUuaQVYiT1fa5LT/IRKKJJdxkUeCY13kZ9Bmze7CsJikT1TLccLonHZCumR25rxbcIhTwV6KBfCvzAvDgAN1KYcK05aHDdunjG3k1AnFhYsd1xzFf1sAwngfwBFdVFV6SGzfTHVEFTom0uUYTlMy8UbKQfkmOfOmH0cWRrT5NlLX48ocqr+htEK+qzDu2IfzgQ3TF7IlikrdCqYhz7p5ckeM12EIlcenPbVKR9WyWEr2V/X3Jx3LsfeiNvz9GFb0oskMzsWlSE34FQ9j2jO8AjleULQtXikVoNzLuTiNfGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775552827; c=relaxed/relaxed;
	bh=hO0i5DF8EvnkES+hyeEAy75jRio1nx20ZDks5J2KtzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPFIZ8AXslF2l2LiUZwa5nBlVilhQBXuMf+1Y85wcS5FEelyoLBzFpdqk5fswPElE3SQkhckeHaZAahBBZB+/LrTSGQaWO6wN9vTzdq6AM3FzggfqD2sDbgs+UvljoVg62PaQqf5ItcS9w6mV/EV+bRarjWycnZ0/y8JyYOn3SdCgaJT1lf31OEMTWrY1cAD0hmsLJFmy65FFa5/fwKVIuNCNAta3gnarusJwYK3r36gfmnfBJjtldfk0erqxiZ6ecPmRslJD+Wchi26KmlERwIm4B656qt9dxqWu5oY5joaLXmqp5aFcpMIcHSdnvQ85VEw+6E/3TaY+0PXk7zD5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=stgpB9oZ; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=stgpB9oZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fqgLg0QP9z2ySk
	for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Apr 2026 19:07:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 090A1600CB;
	Tue,  7 Apr 2026 09:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41DDC116C6;
	Tue,  7 Apr 2026 09:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775552823;
	bh=4NERHreOtOHtxPxrg9hJfCL0sb0Gtcuiwi8WJRXUxIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stgpB9oZ+np9GYARlzUA9ZMs/QvN4KIBqwa1qRYDAwyfYPqyHDzuHCzXPSnlyzgtg
	 EAHXWcSv4E0rrXHIwU/F9B+i1mivT8/hiuEewvUz63bUM7ytEH5SQzK2thj+lYKQTs
	 o2tisu8aVFvQIZG+/d8iAyn9lfuaOQqIZdUeq7k3DZiLr0hgqrYjSRZ2PwzXfNPDL4
	 eowKFIJwq3yekc5lX5NoSnG1UiqaPzINQrHDk6adQBuAm9YxWQDDa+YyftbK/zR8JS
	 kxyiSzhZcnKMojNpglf1PuMqJl8hSj8Ux7HAXRlz/T13loQq/CWQfn1V+eHwkI8KMb
	 5kNMKJjzp6Bvg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wA2Oi-0000000AjGf-2EeN;
	Tue, 07 Apr 2026 11:07:00 +0200
Date: Tue, 7 Apr 2026 11:07:00 +0200
From: Johan Hovold <johan@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Eric Dumazet <edumazet@google.com>,
	Leon Romanovsky <leon@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>, maz@kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Mark Brown <broonie@kernel.org>, alexander.stein@ew.tq-group.com,
	andrew@codeconstruct.com.au, andrew@lunn.ch,
	andriy.shevchenko@linux.intel.com, astewart@tektelic.com,
	bhelgaas@google.com, brgl@kernel.org, davem@davemloft.net,
	devicetree@vger.kernel.org, driver-core@lists.linux.dev,
	hkallweit1@gmail.com, jirislaby@kernel.org, joel@jms.id.au,
	kees@kernel.org, kuba@kernel.org, lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux@armlinux.org.uk, mani@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, robh@kernel.org
Subject: Re: [PATCH v5 8/9] driver core: Replace dev->of_node_reused with
 dev_of_node_reused()
Message-ID: <adTJNMhsghRs3qwy@hovoldconsulting.com>
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
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,rowland.harvard.edu,ozlabs.ru,google.com,lst.de,arm.com,intel.com,ew.tq-group.com,codeconstruct.com.au,lunn.ch,linux.intel.com,tektelic.com,davemloft.net,vger.kernel.org,lists.linux.dev,gmail.com,jms.id.au,lists.infradead.org,lists.ozlabs.org,armlinux.org.uk,redhat.com];
	TAGGED_FROM(0.00)[bounces-3851-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[johan@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORGED_RECIPIENTS(0.00)[m:dianders@chromium.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:stern@rowland.harvard.edu,m:aik@ozlabs.ru,m:edumazet@google.com,m:leon@kernel.org,m:hch@lst.de,m:robin.murphy@arm.com,m:maz@kernel.org,m:aleksander.lobakin@intel.com,m:saravanak@kernel.org,m:broonie@kernel.org,m:alexander.stein@ew.tq-group.com,m:andrew@codeconstruct.com.au,m:andrew@lunn.ch,m:andriy.shevchenko@linux.intel.com,m:astewart@tektelic.com,m:bhelgaas@google.com,m:brgl@kernel.org,m:davem@davemloft.net,m:devicetree@vger.kernel.org,m:driver-core@lists.linux.dev,m:hkallweit1@gmail.com,m:jirislaby@kernel.org,m:joel@jms.id.au,m:kees@kernel.org,m:kuba@kernel.org,m:lgirdwood@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux@armlinux.org.uk,m:mani@kernel.org,m:netdev@vger.kernel.org,m:pabeni@redhat.com,m:robh@kern
 el.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 72C8E3ABBE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 04:23:01PM -0700, Doug Anderson wrote:
> In C, bitfields are not necessarily safe to modify from multiple
> threads without locking. Switch "of_node_reused" over to the "flags"
> field so modifications are safe.

This flag is only set before registering a device with driver core so
there is no issue using the existing bitfield here (with the caveat that
PCI pwrctrl may have gotten that wrong). I haven't checked the other
flags, but I assume most of them work the same way.

But apart from the commit message being misleading, switching to using
atomic ops and accessors for consistency is fine.

> Cc: Johan Hovold <johan@kernel.org>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Not fixing any known bugs; problem is theoretical and found by code
> inspection. Change is done somewhat manually and only lightly tested
> (mostly compile-time tested).
 
> diff --git a/drivers/regulator/bq257xx-regulator.c b/drivers/regulator/bq257xx-regulator.c
> index dab8f1ab4450..40e0f1a7ae81 100644
> --- a/drivers/regulator/bq257xx-regulator.c
> +++ b/drivers/regulator/bq257xx-regulator.c
> @@ -143,7 +143,7 @@ static int bq257xx_regulator_probe(struct platform_device *pdev)
>  	struct regulator_config cfg = {};
>  
>  	pdev->dev.of_node = pdev->dev.parent->of_node;
> -	pdev->dev.of_node_reused = true;
> +	dev_set_of_node_reused(&pdev->dev);
>  
>  	pdata = devm_kzalloc(&pdev->dev, sizeof(struct bq257xx_reg_data), GFP_KERNEL);
>  	if (!pdata)
> diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
> index e66408f23bb6..8297d31cde9f 100644
> --- a/drivers/regulator/rk808-regulator.c
> +++ b/drivers/regulator/rk808-regulator.c
> @@ -2115,7 +2115,7 @@ static int rk808_regulator_probe(struct platform_device *pdev)
>  	int ret, i, nregulators;
>  
>  	pdev->dev.of_node = pdev->dev.parent->of_node;
> -	pdev->dev.of_node_reused = true;
> +	dev_set_of_node_reused(&pdev->dev);
>  
>  	regmap = dev_get_regmap(pdev->dev.parent, NULL);
>  	if (!regmap)

These two uses are broken currently though and should be using
device_set_of_node_from_dev() so that an extra reference is taken to
balance the one dropped by the platform bus code.

I'll send two fixes to Mark, any merge conflict should be trivial to
fixup.

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan

