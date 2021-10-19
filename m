Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D879A43394C
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Oct 2021 16:52:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYcDN23n4z307B
	for <lists+linux-aspeed@lfdr.de>; Wed, 20 Oct 2021 01:52:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eeGlT0cO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eeGlT0cO; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYcDF2p8yz2yZ6;
 Wed, 20 Oct 2021 01:52:45 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 333116137D;
 Tue, 19 Oct 2021 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634655162;
 bh=nL3J2VL9zWYo/wi24YajKfhHZQktfPjrSciiqbNy07s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eeGlT0cOTfvNAjBhOZ74NFgUXq/5n41xtAXXR6sa4MBgyX3mPo14mJm7/QssMQkTl
 UbOjSAaFRZYDcLZLxn644OZceFsnm17mNPR+VRmSE6lH0Q6SJLTSjPQKBmPTFZ5HTL
 yshGnvfFJXF7TN14FUSUQqJ7MCkmx2qALNpev43YAYPmIMxhCNSukfMZ+nh8+5VVoU
 7e+wFysZWMkihrVq7Fa5n3LWvK1iTF6mo3D287cFLUDycWERCvhgm0KMDo4Y7LphUU
 PFI+mI5Tg1QDhmI5BwicnYiXat1ykvSLlTm+McprR0A7njT7MfnezwolSryuEK2FxW
 /gJTgZYWvDTEw==
Date: Tue, 19 Oct 2021 07:52:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: [PATCH v2] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211019075241.7ba9fd0a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211019144127.GA12978@gmail.com>
References: <20211019144127.GA12978@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: sdasari@fb.com, linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, patrickw3@fb.com,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, velumanit@hcl.com,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 19 Oct 2021 20:11:27 +0530 Kumar Thangavel wrote:
>  	len += sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> -	if (nca->payload < 26)
> +	payload = ALIGN(nca->payload, 4)
> +	if (payload < 26)
>  		len += 26;
>  	else
> -		len += nca->payload;
> +		len += payload;

You round up to 4 and then add 26 if the result is smaller.  26 is not
a multiple of 4. Is this intentional?

Also you can write this on one line:

	len += max(payload, 26);
