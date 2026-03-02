Return-Path: <linux-aspeed+bounces-3568-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI+2FnU2pWmv5wUAu9opvQ
	(envelope-from <linux-aspeed+bounces-3568-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 02 Mar 2026 08:04:21 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E911D3A5E
	for <lists+linux-aspeed@lfdr.de>; Mon, 02 Mar 2026 08:04:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPVKW49tqz2xc8;
	Mon, 02 Mar 2026 18:04:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772435055;
	cv=none; b=dI1P1wj2G26aBUAVkrnJBoembJYt/B5CsFy4/hb3E+js/3yVgQrJVPdrtZ+Dz/vFMgZ/VCObe0rRs/XnKENDlgB0cLoa3ITsF1noRbyKNWA79RpGD6QO6pM4R59OKYRNQv8dcgExnflGpWk+qXoHzt5Fi8kv1vVgzG+Y1kyOKSDRX2o6Krj5y+8cjnKAA6Ib8X7yMg12eN5edNRlv5d4y/ijYDzoHgu5P8dFgKTj1TAgCp4jDPZkGEADUyUSoJhB19d/HJH6o80o3nxT7x5wN4DuCztC8WRXQDmNRFiaRuKhpOH3OkTLo6fPAnuV6SAPLTNTk8aU9/iHNGeqXVlGwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772435055; c=relaxed/relaxed;
	bh=0dfE7IQfZ8Ju3U9EmYq9XV/mqrVlX/tVKj8XPlse454=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Be2gOdTVPASHI3QR03PJTdRiHEsmd20hJOLo3KlnKBLtqsaiWr00utz/psjfAG5n5hZWgiUyjFmbaYC2bJUHNJenyhI3Cbnia7AYQdy/L1K85/S+a+mk+OV1L9dbl2pnKxvw62YMk+JLeDQo1eLzpaTRivtxRMVzcEwU+pfTQJKOtDW7z5NMa/3qxi4SYqqItFjcMZzy2e+NKB3GzdUfP2v7ExFvA0C4tpOYJv2xQpQmlVRyhK7nY7s4LNbzQBfXWDybfIuz6bHsh2DqJO19EJfa+mqC0fGYjRliTby4rbE2PE+DZIK81W1jb+rkPjVK9PUx0y90tGCCzaxapWLegg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nQ8iqSxv; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nQ8iqSxv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPVKT6lX5z2xYw
	for <linux-aspeed@lists.ozlabs.org>; Mon, 02 Mar 2026 18:04:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABED042ABE;
	Mon,  2 Mar 2026 07:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CFEC2BCB0;
	Mon,  2 Mar 2026 07:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772435051;
	bh=BEjq3tA3JtO6h36oS89C6amKbmPWOTaLgD17ByLFZZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQ8iqSxvt4d3WmEXGN3VIj+ZdkGx1YeULyWqwch11M9K7vZhLgTq8mQmT/wU1Sq3p
	 8YchhqL2fb5gsIJSUMz6Rd4XDfjq/O2t5V7sgpa9Ap1rZNEckUMGByuSKG0ZKlJtN3
	 LMjZMQmA+ix3MvZD2QeltYjb4dmRGekQJ8cavjsN+CnvxpO4HWfX/oilpnmCiSjzcS
	 MwyMrvyag0GXb2SmLP5YY55qZ/CvmtyUtekfggPRPmC+UA6DNTUNbJRpHPqcU3wtFw
	 JIMjDU8Eef2yERXE8cjD0HoNcS8yZ3k5RefDOWF7UlwFYatqDfPUfxT0PmAJgsENTA
	 BO8eXydY/csBA==
Date: Mon, 2 Mar 2026 08:04:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haiyue Wang <haiyuewa@163.com>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: ast2600: Add reset definition
 for video
Message-ID: <20260302-interesting-tactful-wren-0e2e51@quoll>
References: <20260302011651.94682-1-haiyuewa@163.com>
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
In-Reply-To: <20260302011651.94682-1-haiyuewa@163.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3568-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:haiyuewa@163.com,m:devicetree@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,checkpatch.pl:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C6E911D3A5E
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 09:15:00AM +0800, Haiyue Wang wrote:
> Add ASPEED_RESET_VIDEO reset definition to the ast2600-clock binding
> header. It is required for proper reset control of the video on the
> AST2600 SoC for aspeed-video driver.
> 
> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
> ---
> v3:
>   - Drop 'Fixes:' tag in header file patch.
> v2: https://lore.kernel.org/all/20260227151602.829-1-haiyuewa@163.com/
>   - Fix checkpatch.pl warning, and send dt-bindings as single patch as
>     the submitting-patches guide.
> v1: https://lore.kernel.org/all/20260227123837.70079-1-haiyuewa@163.com/
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


