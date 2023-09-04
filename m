Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEACF791303
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Sep 2023 10:10:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ka9xt4kM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfLsZ6hkhz3bhP
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Sep 2023 18:10:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ka9xt4kM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=mripard@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 561 seconds by postgrey-1.37 at boromir; Mon, 04 Sep 2023 18:10:02 AEST
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfLsQ3YQ2z2yh7
	for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Sep 2023 18:10:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A8395CE0E39;
	Mon,  4 Sep 2023 08:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D61C433C8;
	Mon,  4 Sep 2023 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693814436;
	bh=msH+AlW1tcnzrzUkcVH/Gu9dCYW/mw+O6xT2pWlSs9M=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ka9xt4kMgaXoKCttn3PTsy/pLUsanMSnIUZu5nMztBnSY0Wdzf6Dew7ALC7I+Rqdb
	 ZtFVsXZ0oRdRFZ097j4GXusIpKe6qP1i8uQ060FdShTuPNNV7+Cf12ScsnQLXx2O6k
	 hJsXvyjbbEc/2PmpFJcdizh2eKOeUXKmg+lxtLBmnQvq4kDO7fATE0ZI5V/EbxvIeo
	 /hf0eGtgU7PesSck8b14tvH1M2iSyEmpidZw0ou54S9x+U+JsZO8IozatJNez+bGKq
	 Q2T9/AIU9uHcBmHafOGNfIuDXOb1yZhv58vQFjLoAjQ9cBhnENTAk6MAlYEO4zn25J
	 RTzUxL16SoUBA==
Message-ID: <1506b6324d05084097f1971520d76fa0.mripard@kernel.org>
Date: Mon, 04 Sep 2023 08:00:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 5/6] drm: Call drm_atomic_helper_shutdown() at
 shutdown/remove time for misc drivers
In-Reply-To: <20230901163944.RFT.5.I771eb4bd03d8772b19e7dcfaef3e2c167bce5846@changeid>
References: <20230901163944.RFT.5.I771eb4bd03d8772b19e7dcfaef3e2c167bce5846@changeid>
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
Cc: linux-aspeed@lists.ozlabs.org, tomi.valkeinen@ideasonboard.com, linus.walleij@linaro.org, alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org, airlied@gmail.com, linux-stm32@st-md-mailman.stormreply.com, emma@anholt.net, airlied@redhat.com, daniel@ffwll.ch, raphael.gallais-pou@foss.st.com, Maxime
 Ripard <mripard@kernel.org>, hdegoede@redhat.com, linux-arm-kernel@lists.infradead.org, jfalempe@redhat.com, tzimmermann@suse.de, yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org, philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com, jyri.sarha@iki.fi
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 1 Sep 2023 16:39:56 -0700, Douglas Anderson wrote:
> Based on grepping through the source code these drivers appear to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time
> and at driver remove (or unbind) time. Among other things, this means
> that if a panel is in use that it won't be cleanly powered off at
> system shutdown time.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
