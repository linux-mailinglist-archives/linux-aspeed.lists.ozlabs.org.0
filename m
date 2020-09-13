Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB6226867D
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 09:49:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bqdmt3MNJzDqRs
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Sep 2020 17:49:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Wy38gqJU; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bq4fJ0Q9FzDqPQ
 for <linux-aspeed@lists.ozlabs.org>; Sun, 13 Sep 2020 19:57:11 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id i22so19165725eja.5
 for <linux-aspeed@lists.ozlabs.org>; Sun, 13 Sep 2020 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Gbv3T8O0xJ0qCU1qNd8Of6YIK0SU5dp95SQ3PtDWaO0=;
 b=Wy38gqJUeXaggqjLqI+pGJq8kU7x1t7zpokB4YzSRMZUvWco/F1t5xd0A6p8+/Hg5J
 kD5XAcuBo3dOejieIZrIzgITWoB0bpTnOPJKAD57voEwXtlgLFTVXG0MgwIh5womWalT
 PmN5m9gWb5QDscoT/7/9HnGnHUtqOsUHXVpvSfnO7MDrc1SFN4sYjTRPiBEVUti7+r5V
 fFHvKVyVuqWhZH9CKUIteCsG0cByIERnHKOqxrYjtclMorDRtZ01MVdgUq9bYnH5g5EE
 eyegwOWnCbZHhxIZzhE7ypQchJhlqVhM7OLjLBT+gP/hbgCQkoI9y2zIGRL4rw+qaMhR
 cLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Gbv3T8O0xJ0qCU1qNd8Of6YIK0SU5dp95SQ3PtDWaO0=;
 b=KyvNXe/vEDGBVHR4VY5v/SPw4XYaDQToehKnmjZi9AL3eeFvre1G54buOen1pQ6aRo
 35s2liwwYIAw/CyDe6QNZjQiDN81JkCQ9F+TUkOKCa0F9X2Mrlg2KTDhIc+sGYZwgVEQ
 yk+4V7JuhhYDUtr0/LO99886feqTbOfQypz7ABpqT4XWsMyHUaT4wZtuqPaM1dUkiJoF
 B881p7hQN81LSQ1u1kPHUox6pGTZMvokWbfpkMoprJy6zULLuM/EQ5tLXQ/NjjFx/+sh
 XCkEoIjpE9MzwNCgNDcN5EYcvGQkvnpcpU5ULHEcj7xIWEBNk0CGL/SINKZamEUFQUrE
 e5Gg==
X-Gm-Message-State: AOAM532sQMNgaSZgDuxOVaZcFsCUFiO3ntO8W7sa25XV9tQksqZKcaPu
 6T1JcFKBG3aQ7bZ38letdxY=
X-Google-Smtp-Source: ABdhPJzOcn6Rwbu13exfp1gYWilPlEYFx3hJ/rPNokplQtCfPNYNOKopygMfJTFKWFoYi5bB4a2BHQ==
X-Received: by 2002:a17:906:facb:: with SMTP id
 lu11mr10087536ejb.249.1599991028362; 
 Sun, 13 Sep 2020 02:57:08 -0700 (PDT)
Received: from felia ([2001:16b8:2dcc:7f00:79af:10ed:f757:91c8])
 by smtp.gmail.com with ESMTPSA id w1sm6408015eds.18.2020.09.13.02.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 02:57:07 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 13 Sep 2020 11:57:01 +0200 (CEST)
X-X-Sender: lukas@felia
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: make linux-aspeed list remarks consistent
In-Reply-To: <20200912183334.22683-1-lukas.bulwahn@gmail.com>
Message-ID: <alpine.DEB.2.21.2009131156090.6163@felia>
References: <20200912183334.22683-1-lukas.bulwahn@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Mon, 14 Sep 2020 17:49:20 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Joe Perches <joe@perches.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Sat, 12 Sep 2020, Lukas Bulwahn wrote:

> Commit f15a3ea80391 ("MAINTAINERS: Add ASPEED BMC GFX DRM driver entry")
> does not mention that linux-aspeed@lists.ozlabs.org is moderated for
> non-subscribers, but the other three entries for
> linux-aspeed@lists.ozlabs.org do.
> 
> By 'majority vote' among entries, let us assume it was just missed here and
> adjust it to be consistent with others.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on master and next-20200911
> 
> Joel, please ack.
> David, Daniel, please pick this minor non-urgent clean-up patch.
> 
> This patch submission will also show me if linux-aspeed is moderated or
> not. I have not subscribed to linux-aspeed and if it shows up quickly in
> the archive, the list is probably not moderated; and if it takes longer,
> it is moderated, and hence, validating the patch.
>

I did quickly get back an moderation email that my email is being held 
back. So, that response validates my patch.

Lukas
