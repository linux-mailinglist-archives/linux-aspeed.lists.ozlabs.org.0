Return-Path: <linux-aspeed+bounces-3830-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDQAMSQDzWmSZQYAu9opvQ
	(envelope-from <linux-aspeed+bounces-3830-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 01 Apr 2026 13:36:04 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F074F37990B
	for <lists+linux-aspeed@lfdr.de>; Wed, 01 Apr 2026 13:36:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fm2xF3wpjz2xfX;
	Wed, 01 Apr 2026 22:36:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775043361;
	cv=none; b=FxcpyCAbz6a0HW9aS9egttCGTuMPDofahkDH+QNswqlzzwvaZEtrsl4Vp+yWgiX8hRfEnt/2SkkDFVZRhPWKfvqicL8lbi4SwdF/WTByYK57wNWa6Qsu1BIL28z0JbQLMdFRmdoALpsj+Zzuii2in54zW5AvDJu27LDEEM8sqeydIa+bHiX+wWtk45AW355tgjJHoIMYw5K4RXVxPJmQfzPI5GGUuwTIqgMJ2eQh6jirN6SxT0pzA1YkPzk7aZ2bOoJmKOytot+nKTeHmxlQWeu/IbkeFh5QR/trSZEfQBp82Xm5K34aOyr1CmTu/MEVEQYK1WXZM99O2Y545h9f7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775043361; c=relaxed/relaxed;
	bh=Kwtn7E+4j95Z2DbZtdDe+NkpflDsdvdS9eNbZHrs5rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izpv+ZDuOk5Wx7Hj2PM+M3cvKUq+yizifyYuqvY5/QLY8gMEBSPG/Ruz/XhB9Jj7Y4nj3BctOdMyLIYQooofMClqh+Wr5dB+oxPP6+9tHilWTyDSDsq/QCfpVjUuKrHcGV7EnRqmg7EsJXsTRSlxcVh5Ew3FrmRRkue/aidJ7Bmdi+BR3X1b6FtE0qJfKHysJFhPM9gPRrW08SvhWR4kvXtkUDgkijp8E9nQC25j/47hmNn3WZaEP47LRhBJp4FKEFC4xBNzBj71y2LAnkSPu0Vo4ChBxXay1xAwfN4XJWII52ChZCuXMULBIN+vMxDcQuMxARHC9ZDv/2wneukNuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iBoUc3LC; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iBoUc3LC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fm2xD6dKBz2xd6
	for <linux-aspeed@lists.ozlabs.org>; Wed, 01 Apr 2026 22:36:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47442408F5;
	Wed,  1 Apr 2026 11:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9D8C116C6;
	Wed,  1 Apr 2026 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043358;
	bh=sff6V0+SikbFfnnkuOiFBlCiqZ50wVPswHcHFFLJGmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iBoUc3LC2c+qN4fkZK6Cqw0ymOV5YmE554r9dGUUTJ7ePeCc4aTLdJZgHeyuATAod
	 OW7ZnFmtIf9go8WObN5EjT3d4VNpuWHpc+OoOUneqtbWJ495e1gwd2YwVJkKQH6osk
	 x0Q+9qVhVpqAAw/qGFTGKViqT9KKUK3AG8GNHtkjFmypfV4+YqaB5pFX724M4qxXBB
	 Tmbd/qV7OSfvVc2f/Ycm9o3HEdVCCR2nfka8SxXKibb+81Fxt4aQTBWqt1moenQ7Xp
	 e2ZDPR1I1gzD4nBNXkUd6NBG40yYSCwS1w60HKBZI1QsFyHoLCqdbSvMh4a5dQWF7I
	 B3N/vFNsrmt6w==
Date: Wed, 1 Apr 2026 13:35:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] aspeed: first batch of devicetree changes for v7.1
Message-ID: <20260401-duck-of-striking-engineering-3bcfab@quoll>
References: <df8ef5ea7b9e254658934c18de20fd9805a82d74.camel@codeconstruct.com.au>
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
In-Reply-To: <df8ef5ea7b9e254658934c18de20fd9805a82d74.camel@codeconstruct.com.au>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-3830-lists,linux-aspeed=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:soc@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:joel@jms.id.au,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: F074F37990B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 01:39:52PM +1030, Andrew Jeffery wrote:
> Hello SoC maintainers,
> 
> Here's the first batch of ASPEED devicetree changes for v7.1.
> 
> Please pull.
> 
> Cheers,
> 
> Andrew
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed-7.1-devicetree-0
> 
> for you to fetch changes up to 76b4ec8efdc3887cdbf730da2e55881fc1a18770:
> 
>   ARM: dts: aspeed: anacapa: Add retimer EEPROMs (2026-02-23 12:02:22 +1030)

Thanks, applied

Best regards,
Krzysztof


