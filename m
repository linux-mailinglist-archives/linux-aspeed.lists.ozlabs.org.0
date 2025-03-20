Return-Path: <linux-aspeed+bounces-1088-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F08A6AB85
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 Mar 2025 17:55:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJWst1r3lz2yrD;
	Fri, 21 Mar 2025 03:55:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742489730;
	cv=none; b=oZ9ng+rTa9UoHXFQ3Iu+OwEw6O3xknYaOa1NVvmF6ALT/VaR+av1QWFuM4x9lhJuAmVn6bLqfZM4qzOkZwMXH7Dwgz0DdVWHv42vhqOfPOhB68USlxfi4tl43d3zBAQihjDLUo543i8L39olSHpEJ1iTwaenIgl13mJ9jw4A3mr6xH7gVPxaAoaDQVaC7JOaZl0WudigoiWAu+sNf40m38fNSlMx6KPYB1q1v8Gi57K3vQJ28ZHkcaj+TtY3yM8P/vagGddGRuj0E9E/aAnnWMYZdKYgdhwQevh+o7iH9G3Gg4XwrLWeXRP/KzNtayH0ZKP5k3UC1EnzmX/9b42FoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742489730; c=relaxed/relaxed;
	bh=P0Ivq67bbotH4ADjJAlFztdw/IUYFM+eBRURP7U+L1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O03j4honodFPJDrJHyQEF1ip7IY6/YtW5WuSNTAo5zkhsSIP0/GODqSHptZvpN5RV0WKEop7bOX7kDe/HeUbROAudRhe75vnLZfLVKugmvjtOOpzR+gnuB1rhDSxfQMBcmZfgtJPKf0h6sjQj0XP2eEDz2pUUVFSE5Zfdp96IakBbmlLBgOO4oryTgSpSMbZkI0DR22S1dSRInfjjg7/e9eQ4WU8JirijOCEJPvKki+i9gmmJJWCTEbjXqAy1RDE73O4cYi3SrepJS9ai3F5JYKRox3cTHrcdd8BPZ2O4omkEjXPCPusM8JfGCO+qmREaAmxWgGlhHmSgr45qoC99A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=MlEEVOai; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=MlEEVOai;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJWsr2npJz2xdg;
	Fri, 21 Mar 2025 03:55:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=P0Ivq67bbotH4ADjJAlFztdw/IUYFM+eBRURP7U+L1E=; b=MlEEVOaiCDs90bRztnCdRaJ8ow
	OK0zmlKkUw3+EaeajJmdoGHTn6Kq3ENk0vEmbsBu+0tX/1xvNzVUS4OfrbQ/lz1HOWHzvSZG+q1oq
	mDXmR2Jb9BJrw+qDVUbZqkMolVWFZq7SpGAwiRLh7lfbtwfMzApi/DHu41/+eiJ3NXxY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tvJAZ-006V1c-OP; Thu, 20 Mar 2025 17:54:59 +0100
Date: Thu, 20 Mar 2025 17:54:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Willie Thai <wthai@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, kees@kernel.org,
	tony.luck@intel.com, gpiccoli@igalia.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, openbmc@lists.ozlabs.org,
	leohu@nvidia.com, tingkaic@nvidia.com, dkodihalli@nvidia.com,
	Mars Yang <maryang@nvidia.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH v3 1/2] ARM: dts: aspeed: Add device tree for Nvidia's
 GB200NVL BMC
Message-ID: <fbf6a89b-80c4-47f3-9dad-2725c040e041@lunn.ch>
References: <20250320164633.101331-1-wthai@nvidia.com>
 <20250320164633.101331-2-wthai@nvidia.com>
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
In-Reply-To: <20250320164633.101331-2-wthai@nvidia.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>   - Skip mac setting and wait till the delay issue in phy-mode fix from Aspeed SOC vendor side [Andrew]

For this part only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

