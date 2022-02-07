Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7B14AC665
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Feb 2022 17:48:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JssXQ11z6z3bPM
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Feb 2022 03:48:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=srs0=xgpx=sw=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JssXL2qcJz2yYJ;
 Tue,  8 Feb 2022 03:48:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0AA89601B6;
 Mon,  7 Feb 2022 16:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82029C004E1;
 Mon,  7 Feb 2022 16:48:14 +0000 (UTC)
Date: Mon, 7 Feb 2022 11:48:13 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH] fsi: Add trace events in initialization path
Message-ID: <20220207114813.3856554e@gandalf.local.home>
In-Reply-To: <20220207161640.35605-1-eajames@linux.ibm.com>
References: <20220207161640.35605-1-eajames@linux.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-aspeed@lists.ozlabs.org, alistair@popple.id.au,
 linux-kernel@vger.kernel.org, mingo@redhat.com, jk@ozlabs.org,
 linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon,  7 Feb 2022 10:16:40 -0600
Eddie James <eajames@linux.ibm.com> wrote:

> Add definitions for trace events to show the scanning flow.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>=20

=46rom a tracing point of view, I don't see anything wrong with this patch.

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve
