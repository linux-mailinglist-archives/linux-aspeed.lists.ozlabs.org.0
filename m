Return-Path: <linux-aspeed+bounces-7-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CCA9A9022
	for <lists+linux-aspeed@lfdr.de>; Mon, 21 Oct 2024 21:50:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXQrm5nfKz2yT0;
	Tue, 22 Oct 2024 06:50:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729540216;
	cv=none; b=lWjojW8YYStNWK2bR2WnL2CDFjjVrSGtxTKHXfyoMKnU6cVlqDVE6Bv/xB+sV3FJcc4HtwM/XgIdDV7YyJVOrA3hLvquZS/P1/ayIHwndJksEdqR/y/YAuSZF4Hq0moAzkcVpDvqZ/oh67UlgLfVN/alTLhfBs+OoXSRg9BlJMaU79uSXqxGsD7JWBRgKh2JirINiLM9tafGJ1T2eK/p+OCUiRlCQjvOkH5R2UESNmuwxT4Wsg5P/eT7OMI0lcm04+smVB7e4fo/WRLKIT1V66v3oi8zvFUHJ1QP2HiCvM4blI1o1BuLXsqJPRy55ax57NvQEO9J6cblE6w5HuBpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729540216; c=relaxed/relaxed;
	bh=6RAWm5EvMBXINnlfWkkxno/INvB5EfxJ2HRQAGorfn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeslSQ8ER86Sv2KxEro73Qb6sdRWxnKR99ZtllGNttC1CffWFBRTYp59OCIrF9Go6KTeqvg7e1XkWD7IspdS4GcJbXGh4LtwORqdEXL1qqy5VqZ2n9pbdvYk3rKELRtPEmDInjFd0WPYd9JyGDhR1LM8x6NT+saGNiXclKUJ5AYr7qMsqbq/YnJKHE7uUtHoFmx6QbDqwr64mxgp+ICsjOUY36ve2zQb27tcHQnm8q4gCi1DnHUZie5+Fo0k8OIUjgH69Fb3JWduY0W5fYONNg6iRheqE2BP8tg9rHGR49bxXe0JkaC75OXw0du+fP9dx7De+RIpmpZvjxkBIQ0uug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uyhZIGvk; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uyhZIGvk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXQrl6JmSz2yRG;
	Tue, 22 Oct 2024 06:50:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A27C5C5A5B;
	Mon, 21 Oct 2024 19:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64046C4CEE5;
	Mon, 21 Oct 2024 19:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729540212;
	bh=eZYf3GJHPEiM9OohyeCcgFDCaHIVP50U9kyroIh1Xm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uyhZIGvkS2Onm//7dOxuVzku5f4l75aicLhlLCLxV+xc4DCV6MbYTlEHMhpiFK2/D
	 Ig2V5GO1I20kaQOYfAVPjexFqjmrR154+RmH92/WvOro4oUR88cZpdpdWTXcU5e54o
	 xVBOGpqmtSpcWovV45eGhiAk0EyFAuXnJ1oDm7TGWfPJQykSut9PIXa3E2T8Y5Fnyt
	 w63ClYON3N/XKApIdPju660n8Ddig3FGo6JZ598U2i3vXsH+TR89/uBhL0aaVWn4GD
	 M/4/oivOKvJ6DBk3Y8LX60FdFoQm5dcIR5H4H+PB/ekWDBaEgqfPsTDBTOxMv9iaNX
	 5+N44evzinVTQ==
Date: Mon, 21 Oct 2024 14:50:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chanh Nguyen <chanh@os.amperecomputing.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
	linux-arm-kernel@lists.infradead.org,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thang Nguyen <thang@os.amperecomputing.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Khanh Pham <khpham@amperecomputing.com>,
	linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Mt. Jefferson board
Message-ID: <172954021092.1028025.10007351603543504033.robh@kernel.org>
References: <20241021083702.9734-1-chanh@os.amperecomputing.com>
 <20241021083702.9734-2-chanh@os.amperecomputing.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021083702.9734-2-chanh@os.amperecomputing.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Mon, 21 Oct 2024 08:37:01 +0000, Chanh Nguyen wrote:
> Document Ampere's Mt. Jefferson BMC board compatible.
> 
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
> Changes in v2:
>   - Document Mt. Jefferson board compatible                   [Krzysztof]
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


