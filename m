Return-Path: <linux-aspeed+bounces-4207-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i/5xEbgEKGqO7QIAu9opvQ
	(envelope-from <linux-aspeed+bounces-4207-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 09 Jun 2026 14:19:04 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6389965FF84
	for <lists+linux-aspeed@lfdr.de>; Tue, 09 Jun 2026 14:19:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nUrsJUo4;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4207-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4207-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZSd129zhz2yv2;
	Tue, 09 Jun 2026 22:19:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781007541;
	cv=none; b=fYjVCYeVT/4ZmAfhgkGyq/trfsIX1iD5IBsIudSBtZ0X0N49qR+dvAoyq8zAdMZTieT2zotoJ6eSw1a6RUFH9tRBOCFrIKXpwYfHUJ8SyY0xqpVO2zxwfgF6jXwtICp5b5x7Mf/ugbX0EbpSA/DW5YcQLS9haA9VxpU/NWxyeTe3sWTFQvsiyW/zlqNXaN7aRom8zpOQRbHhuXrdyMavEBJ9+la9L65FDSOZSZzutd0zCJM+VAghVrnulM8Cdi52IZTL8RxGb+elvDKKigR6BPbT6C0JXuN6zFbdAUr0JaVRwSH52Fzb/eOxj0BIKJ4JX3od/6vLq3UOM7bZJtDsbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781007541; c=relaxed/relaxed;
	bh=vDOEE8xBUSXxvq4xLfdOp0TCxRvuaF7+Cmh+3kfoHpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCp3GUlYjMD00T8LoObAHB9cgp95HIGCQE0xkrdw06jp49H/YK8hksvqTikDxb2kWX+37t9FQYVcuGHNEhMz05iTTQJ/dnR2gkpQweuzvAUVJSLA3dQcqHVJfD01AXxp4GLzoq15f6vgB85+oeTASaxPup0dqxxV2NNLtDOyhOV1AKF6vGRqk6qUSMoOKYlxFH13pmfMoZYygsX+O73rjthMT5SDTstZD3OGiclpNCiyejqlcxW9bVmb88jKPdMrjJp6iI7htSivCzHxbS6S8V3ptJEHdfXXfOOrj5L5Ho+TPnNCgyl8vQzIuf4J3llVk2nLSkQu1uX631XmScnh+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nUrsJUo4; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZSd04jM7z2ytV
	for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Jun 2026 22:19:00 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A3FC4353C;
	Tue,  9 Jun 2026 12:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE091F00893;
	Tue,  9 Jun 2026 12:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781007538;
	bh=vDOEE8xBUSXxvq4xLfdOp0TCxRvuaF7+Cmh+3kfoHpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nUrsJUo4SBKUrJ95fNqHM7pJvu41I5sV4u6qmdzT46KMoUiI3QxhnETMEomM1BtgF
	 wwaQL/RoH5HufkUOZectSI3noKVXotyShS5hikS4/xGVaGHzXQgVRALWFpNSLv4aYh
	 Gey+VJ+gxydk9kYpnIuoGKemrS98uO5GM5ATv1knOtXYsn71FnX3YbVaLM+8ITLkuS
	 D6TWh3teAkMZFabGIlK01zvI9Wb7JyqsopMHLibnqbW6imSojLIiRVJ+eB369GeaGc
	 ITPlPwPtKqR8wraGxn/YyxqOn0xg2qhZrv1O49cLoo9uyOFKfLSr15B5KMvuSoH2j/
	 HtkYY9mICf1lw==
Date: Tue, 9 Jun 2026 14:18:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [RESEND,GIT PULL] aspeed: First batch of ARM devicetree changes
 for v7.2
Message-ID: <20260609-axiomatic-bizarre-boar-03f773@quoll>
References: <cbd2822caa9fc7c2b4567703be785b9b4fd829cd.camel@codeconstruct.com.au>
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
In-Reply-To: <cbd2822caa9fc7c2b4567703be785b9b4fd829cd.camel@codeconstruct.com.au>
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:soc@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:joel@jms.id.au,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-4207-lists,linux-aspeed=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6389965FF84

On Wed, Jun 03, 2026 at 04:48:43PM +0930, Andrew Jeffery wrote:
> Hi SoC maintainers,
> 
> The first attempt[1] missed the preamble, so here's the same again,
> this time with it included.
> 
> [1]: https://lore.kernel.org/soc/55ab27bc5e09252b1dbfdf1505693eb193b8e846.camel@codeconstruct.com.au/
> 
> Cheers,
> 
> Andrew
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed-7.2-devicetree-0
> 
> for you to fetch changes up to 1249ee157de518a76cec169e2a5db4d6e523cc90:
> 
>   ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT linename (2026-05-27 12:44:26 +0930)
> 

Thanks, applied

Best regards,
Krzysztof


